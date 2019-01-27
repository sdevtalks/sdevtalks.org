# frozen_string_literal: true

class SitemapsController < ApplicationController
  def index
    @url_base = "https://sdevtalks.org"
    @events = Event.all

    respond_to do |format|
      format.xml
    end
  end
end
