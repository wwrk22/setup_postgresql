json.extract! to_do_item, :id, :description, :todolist_id, :created_at, :updated_at
json.url to_do_item_url(to_do_item, format: :json)
