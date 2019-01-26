class ProposalsToTalk < ApplicationRecord
  belongs_to :proposal
  belongs_to :talk
end
