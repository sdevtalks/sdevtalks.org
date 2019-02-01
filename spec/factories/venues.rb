# frozen_string_literal: true

FactoryBot.define do
  factory :venue do
    sequence(:name) {|i| "venue_#{i}" }
    sequence(:address) {|i| "venue_address_#{i}" }
    sequence(:description) {|i| "venue_desc_#{i}" }
    sequence(:google_maps_url) {|i| "https://goo.gl/maps/#{i}" }
    sequence(:google_maps_embed_url) {|i| "https://www.google.com/maps/embed?pb=#{i}" }
  end
end
