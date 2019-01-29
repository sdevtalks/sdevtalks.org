# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    venue

    sequence(:title) {|i| "event_title_#{i}" }
    sequence(:pretty_title) {|i| "event-pretty-title-#{i}" }
    sequence(:description) {|i| "event_desc_#{i}" }
    key { Event.new.generate_key }
    starts_at { Time.current.beginning_of_day }
    ends_at { Time.current.end_of_day }
  end
end
