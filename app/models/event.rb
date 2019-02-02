require 'validators/spinal_case_validator'

KeyNotGeneratedError = Class.new(StandardError)

class Event < ApplicationRecord
  belongs_to :venue

  validates :title,        presence: true
  validates :description,  presence: true
  validates :pretty_title, presence: true, uniqueness: true, spinal_case: true
  validates :key,          presence: true, uniqueness: true
  validates :venue_id,     presence: true
  validates :starts_at,    presence: true
  validates :ends_at,      presence: true
  validate :validate_duration,
    if: Proc.new { |record| record.errors['starts_at'].empty? && record.errors['ends_at'].empty? }

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

  private

  def duration
    self.ends_at - self.starts_at
  end

  def validate_duration
    if duration <= 0
      errors[:base] << "end_at must be greater than start_at"
    end

    if duration > 24.hours
      errors[:base] << "Too long event. Everyone will be exhausted."
    end
  end
end
