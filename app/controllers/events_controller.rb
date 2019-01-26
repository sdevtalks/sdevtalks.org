# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.eager_load(:venue).all
  end
end
