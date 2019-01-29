# frozen_string_literal: true

FactoryBot.define do
  factory :venue do
    sequence(:name) {|i| "venue_#{i}" }
    sequence(:address) {|i| "venue_address_#{i}" }
    sequence(:description) {|i| "venue_desc_#{i}" }
  end
end
