# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @upcoming_events = Event.eager_load(:venue).upcoming(Time.zone.now).recently
  end
end
