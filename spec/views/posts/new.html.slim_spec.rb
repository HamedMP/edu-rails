require 'spec_helper'

describe "posts/new", :type => :view do
  before(:each) do
    assign(:post, build(:post))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_body[name=?]", "post[body]"

      assert_select "input#post_is_featured[name=?]", "post[is_featured]"

      assert_select "select#post_category_id[name=?]", "post[category_id]"

      assert_select "input#post_is_vacancy[name=?]", "post[is_vacancy]"
    end
  end
end
