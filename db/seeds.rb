categories = ActiveSupport::JSON.decode(Rails.root.join('db', 'seeds', 'categories.json').read)

categories.each do |category_attrs|
  parent = Category.find_or_initialize_by(
    slug: category_attrs['slug'],
    title: category_attrs['title'],
    order: category_attrs['order']
  )
  unless parent.persisted?
    p parent if parent.save!
  end

  if category_attrs['sub-categories']
    category_attrs['sub-categories'].each do |sub_attrs|
      child = Category.find_or_initialize_by(
        slug: sub_attrs['slug'],
        title: sub_attrs['title'],
        order: sub_attrs['order'],
        parent: parent
      )
      unless child.persisted?
        p child if child.save!
      end
    end
  end
end
