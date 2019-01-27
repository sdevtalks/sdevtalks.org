# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @upcoming_event = Event.eager_load(:venue).upcoming(Time.zone.now).first
  end
end
