require 'spec_helper'

describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts, create_list(:post, 9))
    assign(:featured, create_list(:post, 4, is_featured: true))
    assign(:vacancies, create_list(:post, 9, is_vacancy: true))
  end

  it "renders a list of posts" do
    render
    assert_select "article", count: 22
  end
end
