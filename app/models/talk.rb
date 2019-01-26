class Talk < ApplicationRecord
  belongs_to :event
  belongs_to :speaker
  has_one :proposals_to_talk
  has_one :proposal, through: :proposals_to_talk
end
