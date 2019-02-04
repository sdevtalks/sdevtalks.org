class Talk < ApplicationRecord
  belongs_to :event
  has_one :proposals_to_talk
  has_one :proposal, through: :proposals_to_talk

  validates :title,         presence: true
  validates :description,   presence: true
  validates :event_id,      presence: true
  validates :speaker_name,  presence: true
  validates :speaker_email, presence: true
end
