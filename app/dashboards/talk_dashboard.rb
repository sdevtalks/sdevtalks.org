require "administrate/base_dashboard"

class TalkDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    event: Field::BelongsTo,
    # proposals_to_talk: Field::HasOne,
    # proposal: Field::HasOne,
    id: Field::Number,
    title: Field::String,
    speaker_name: Field::String,
    speaker_email: Field::String,
    speaker_sns_id: Field::String,
    speaker_sns_url: Field::String,
    speaker_belongs: Field::String,
    speaker_role: Field::String,
    slide_url: Field::String,
    video_url: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :event,
    :title,
    :speaker_name,
    :speaker_sns_id,
    # :proposals_to_talk,
    # :proposal,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :event,
    # :proposals_to_talk,
    # :proposal,
    :id,
    :title,
    :speaker_name,
    :speaker_email,
    :speaker_sns_id,
    :speaker_sns_url,
    :speaker_belongs,
    :speaker_role,
    :slide_url,
    :video_url,
    :description,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :event,
    # :proposals_to_talk,
    # :proposal,
    :title,
    :speaker_name,
    :speaker_email,
    :speaker_sns_id,
    :speaker_sns_url,
    :speaker_belongs,
    :speaker_role,
    :slide_url,
    :video_url,
    :description,
  ].freeze

  # Overwrite this method to customize how talks are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(talk)
  #   "Talk ##{talk.id}"
  # end
end
