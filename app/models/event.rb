KeyNotGeneratedError = Class.new(StandardError)

class Event < ApplicationRecord
  belongs_to :venue

  validate :validate_duration

  scope :upcoming, ->(now) { where("starts_at > ?", now) }
  scope :recently, -> { order(starts_at: :asc) }

  def self.create_with_key!(*args)
    instance = self.new(*args)
    instance.generate_key
    instance.save!
    instance
  end

  def slug
    raise KeyNotGeneratedError if self.key.blank?
    "#{self.pretty_title}-#{self.key}"
  end

  def generate_key
    self.key = SecureRandom.alphanumeric(6)
  end

  def ended?
    Time.zone.now > self.ends_at
  end

  def full_title
    "s-dev talks 〜サービス開発勉強会〜「#{self.title}」"
  end

  def formatted_opening_date
    "#{self.starts_at.strftime("%Y年%m月%d日 %H:%M")}~#{self.ends_at.strftime("%H:%M")}"
  end

  private

  def validate_duration
    if duration <= 0
      errors[:base] << "end_at must be greater than start_at"
    end

    if duration > 24.hours
      errors[:base] << "Too long event. Everyone will be exhausted."
    end
  end
end
