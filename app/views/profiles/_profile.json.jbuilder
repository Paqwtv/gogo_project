json.extract! profile, :id, :user_name, :gender, :created_at, :updated_at
json.url profile_url(profile, format: :json)
