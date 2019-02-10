class Talk < ApplicationRecord
  belongs_to :event
  has_one :proposals_to_talk
  has_one :proposal, through: :proposals_to_talk

  validates :title,         presence: true
  validates :description,   presence: true, allow_blank: true
  validates :event_id,      presence: true
  validates :speaker_name,  presence: true
  validates :speaker_email, presence: true

  before_validation :set_secret_token

  # This kind of logic should not live in model layer.
  # But because of convenience in administrate, this method lives here.
  # @return [String, nil]
  def secret_edit_path
    return nil if new_record?
    Rails.application.routes.url_helpers.edit_database_talk_path(self, secret_token: secret_token)
  end

  private

  def set_secret_token
    self.secret_token ||= SecureRandom.alphanumeric(32)
  end
end
