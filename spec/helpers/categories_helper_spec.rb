describe CategoriesHelper, :type => :helper do
  describe "category_path" do
    it "aliases to category_posts_path" do
      category = create :category
      expect(category_path(category)).to eq category_posts_path(category)
    end
  end

  describe "category_url" do
    it "aliases to category_posts_url" do
      category = create :category
      expect(category_url(category)).to eq category_posts_url(category)
    end
  end
end
