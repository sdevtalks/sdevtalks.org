# frozen_string_literal: true

class TalksController < ApplicationController
  def edit
    @talk = Talk.find_by!(id: params[:id], secret_token: params[:secret_token])
  end

  def update
    @talk = Talk.find_by!(id: params[:id], secret_token: params[:secret_token])

    if @talk.update(editable_params)
      redirect_to edit_event_talk_path(event_slug: @talk.event.slug, id: @talk.id, secret_token: @talk.secret_token)
    else
      render :edit
    end
  end

  private

  def editable_params
    params.require(:talk).permit(
      # Speaker info
      :speaker_name,
      :speaker_email,
      :speaker_sns_id,
      :speaker_sns_url,
      :speaker_belongs,
      :speaker_role,
      # Talk info
      :title,
      :description,
      # Materials
      :slide_url,
      :video_url,
    )
  end
end
