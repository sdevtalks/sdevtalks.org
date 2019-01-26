KeyNotGeneratedError = Class.new(StandardError)

class Event < ApplicationRecord
  belongs_to :venue

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
end
