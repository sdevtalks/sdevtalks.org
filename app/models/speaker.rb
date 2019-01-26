class Speaker < ApplicationRecord
  has_many :proposals
  has_many :talks
end
