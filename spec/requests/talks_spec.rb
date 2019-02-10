require "rails_helper"

RSpec.describe 'Talks page', type: :request do
  describe 'edit' do
    let(:talk) { create(:talk) }

    context 'with secret_token' do
      it 'should be accessible' do
        get "/events/#{talk.event.slug}/talks/#{talk.id}/edit?secret_token=#{talk.secret_token}"
        expect(response).to have_http_status(200)
      end
    end

    context 'without secret_token' do
      it 'should not be found' do
        get "/events/#{talk.event.slug}/talks/#{talk.id}/edit"
        expect(response).to have_http_status(404)
      end
    end
  end
end
