json.array!(@posts) do |post|
  json.extract! post, :id, :title, :published_at, :body, :is_featured, :category_id, :expired_at, :is_vacancy
  json.url post_url(post, format: :json)
end
