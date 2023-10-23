class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :image_url, :date, :start_time, :end_time, :venue_name, :event_location, :available_tickets_count, :organiser_id, :price
end
