json.array!(@categories) do |category|
  json.extract! category, :id, :title, :slug, :order, :category_id
  json.url category_url(category, format: :json)
end
