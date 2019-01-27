class Venue < ApplicationRecord
  def google_maps_url
    "https://www.google.com/maps/search/#{address}"
  end
end
