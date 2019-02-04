class Venue < ApplicationRecord
  validates :name,                  presence: true
  validates :address,               presence: true
  validates :description,           presence: true
  validates :google_maps_url,       presence: true
  validates :google_maps_embed_url, presence: true
end
