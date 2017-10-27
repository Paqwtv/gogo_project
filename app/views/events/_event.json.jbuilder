json.extract! event, :id, :author, :title, :description, :date_time, :latitude, :longitude, :private, :address, :checked_by_as, :created_at, :updated_at
json.url event_url(event, format: :json)
