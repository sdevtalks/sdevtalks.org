# frozen_string_literal: true

FactoryBot.define do
  factory :talk do
    event

    sequence(:title) {|i| "talk_title_#{i}" }
    sequence(:speaker_name) {|i| "speaker_name_#{i}" }
    sequence(:speaker_email) {|i| "#{i}@example.com" }
    sequence(:description) {|i| "talk_desc_#{i}" }
    secret_token { SecureRandom.alphanumeric(32) }
  end
end
