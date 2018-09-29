json.extract! inquiry, :id, :user, :house, :subject, :msg, :created_at, :updated_at
json.url inquiry_url(inquiry, format: :json)
