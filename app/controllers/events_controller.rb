# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @page_title = "Events"
    @events = Event.eager_load(:venue).order(starts_at: :desc)
  end

  def show
    key = params[:slug].split("-").last

    @event = Event.find_by!(key: key)

    unless params[:slug] == @event.slug
      redirect_to event_path(@event.slug), status: 301
    end

    @page_title = @event.title
  end
end
