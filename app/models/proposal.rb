class Proposal < ApplicationRecord
  belongs_to :event
  has_one :proposals_to_talk
  has_one :talk, through: :proposals_to_talk
end
