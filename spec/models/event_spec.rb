# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event do
  describe "#generate_key" do
    before do
      event_already_exist = create(:event)
      @key_already_exist = event_already_exist.key
    end

    specify "should re-generate key if generated key value exists" do
      expect(SecureRandom).to receive(:alphanumeric).with(6).and_return(@key_already_exist, "second-key")
      expect(Event.new.generate_key).to eq("second-key")
    end
  end
end
