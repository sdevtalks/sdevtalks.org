KeyNotGeneratedError = Class.new(StandardError)

class Event < ApplicationRecord
  belongs_to :venue

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
    new_key = SecureRandom.alphanumeric(6)
    if Event.exists?(key: new_key)
      generate_key
    else
      self.key = new_key
    end
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
end
