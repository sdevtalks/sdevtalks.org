class Proposal < ApplicationRecord
  belongs_to :event
  has_one :proposals_to_talk
  has_one :talk, through: :proposals_to_talk

  validates :title,         presence: true
  validates :abstract,      presence: true
  validates :event_id,      presence: true
  validates :speaker_name,  presence: true
  validates :speaker_email, presence: true
  validates :video_stance,  presence: true
end
