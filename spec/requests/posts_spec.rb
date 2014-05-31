require 'spec_helper'

describe "Posts", :type => :request do
  describe "GET /" do
    before(:each) do
      create_list(:post, 9)
      create_list(:post, 4, is_featured: true)
      create_list(:post, 9, is_vacancy: true)
    end

    it "works! (now write some real specs)" do
      get root_path
      expect(response.status).to be(200)
    end

    describe 'Compression' do
      context "a visitor has a browser that supports compression" do
        ['deflate','gzip', 'deflate,gzip','gzip,deflate'].each do |compression_method|
          it 'has Content-Encoding header' do
            get root_path, {}, {'HTTP_ACCEPT_ENCODING' => compression_method }
            expect(response.headers['Content-Encoding']).to be
          end
        end
      end

      context "a visitor's browser does not support compression" do
        it 'does not have Content-Encoding header' do
          get root_path
          expect(response.headers['Content-Encoding']).not_to be
        end
      end
    end
  end

  describe "GET /categories/:id/posts" do
    it "works! (now write some real specs)" do
      category = create :category
      get category_posts_path(category)
      expect(response.status).to be(200)
    end
  end
end
