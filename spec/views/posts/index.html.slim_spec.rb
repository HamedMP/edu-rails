require 'spec_helper'

describe "posts/index", :type => :view do
  before(:each) do
    assign(:posts, create_list(:post, 2))
  end

  it "renders a list of posts" do
    render
    assert_select "table.posts > tbody > tr", count: 2
  end
end
