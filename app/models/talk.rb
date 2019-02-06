class Talk < ApplicationRecord
  belongs_to :event
  has_one :proposals_to_talk
  has_one :proposal, through: :proposals_to_talk

  validates :title,         presence: true
  validates :description,   presence: true
  validates :event_id,      presence: true
  validates :speaker_name,  presence: true
  validates :speaker_email, presence: true

  before_validation :set_secret_token

  def secret_url
    "https://sdevtalks.org/events/#{event.slug}/talks/#{id}/edit?secret_token=#{secret_token}"
  end

  private

  def set_secret_token
    self.secret_token ||= SecureRandom.alphanumeric(32)
  end
end
