module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      if Rails.env.production?
        authenticate_or_request_with_http_basic do |username, password|
          username == 'admin' && password == ENV['BASIC_AUTH_PASSWORD']
        end
      end
    end
  end
end
