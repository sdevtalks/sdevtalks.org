# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @page_title = "Events"
    @events = Event.eager_load(:venue).order(starts_at: :desc)
  end

  def show
    pretty_title = params[:slug].split("-")[0..-2].join("-")
    key          = params[:slug].split("-").last

    @event = Event.find_by!(pretty_title: pretty_title, key: key)
    @page_title = @event.title
  end
end
