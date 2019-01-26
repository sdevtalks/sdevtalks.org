class Talk < ApplicationRecord
  belongs_to :event
  has_one :proposals_to_talk
  has_one :proposal, through: :proposals_to_talk
end
