json.extract! schedule_item, :id, :title, :start_time, :notes, :created_at, :updated_at
json.url schedule_item_url(schedule_item, format: :json)
