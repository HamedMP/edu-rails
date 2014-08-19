json.extract! @post, :id, :title, :body, :published_at

json.category @post.category, :id, :title
