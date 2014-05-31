describe PostsHelper, :type => :helper do
  describe "post_path" do
    it "aliases to category_post_path" do
      post = create :post
      expect(post_path(post)).to eq category_post_path(post.category, post.to_path_params)
    end
  end

  describe "post_url" do
    it "aliases to category_post_url" do
      post = create :post
      expect(post_url(post)).to eq category_post_url(post.category, post.to_path_params)
    end
  end
end
