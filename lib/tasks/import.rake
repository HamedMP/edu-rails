task :import, [:url, :limit] => :environment do |t, args|
  args.with_defaults(url: Rails.application.secrets.old_database_url, limit: 100)

  # Connect to database.
  uri = URI.parse(args[:url])
  postgres = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)

  # Memoize categories
  categories_map = {}

  # Get some posts
  entries = postgres.exec("SELECT title, slug, pub_date, body, featured, category_id, expire_date FROM web_entry LIMIT #{args[:limit]}")
  entries.num_tuples.times do |i|
    entry_hash = entries[i]

    unless categories_map[entry_hash['category_id']]
      category_slug = postgres.exec("SELECT slug FROM web_category WHERE id = #{entry_hash['category_id']} LIMIT 1")[0]['slug'].downcase
      categories_map[entry_hash['category_id']] = Category.find_by(slug: category_slug).id
    end

    entry_hash['category_id'] = categories_map[entry_hash['category_id']]

    # rename pub_date to published_at
    entry_hash['published_at'] = entry_hash.delete 'pub_date'
    entry_hash['is_featured'] = entry_hash.delete 'featured'
    entry_hash['expired_at'] = entry_hash.delete 'expire_date'
    entry_hash['created_at'] = entry_hash['published_at']

    post = Post.find_or_initialize_by entry_hash
    unless post.persisted?
      post.save!
      p post
    end
  end
end
