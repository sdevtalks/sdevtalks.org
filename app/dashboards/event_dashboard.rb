require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    venue: Field::BelongsTo,
    title: Field::String,
    pretty_title: Field::String,
    description: Field::Text,
    connpass_url: Field::String,
    published: Field::Boolean,
    starts_at: Field::DateTime,
    ends_at: Field::DateTime,
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
    :title,
    :pretty_title,
    :published,
    :venue,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :venue,
    :title,
    :pretty_title,
    :description,
    :connpass_url,
    :published,
    :starts_at,
    :ends_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :venue,
    :title,
    :pretty_title,
    :description,
    :connpass_url,
    :published,
    :starts_at,
    :ends_at,
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.

  def display_resource(event)
    event.title
  end
end
