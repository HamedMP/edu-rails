require 'spec_helper'

describe "posts/edit", :type => :view do
  before(:each) do
    @post = assign(:post, create(:post))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"

      assert_select "textarea#post_body[name=?]", "post[body]"

      assert_select "input#post_is_featured[name=?]", "post[is_featured]"

      assert_select "select#post_category_id[name=?]", "post[category_id]"

      assert_select "input#post_is_vacancy[name=?]", "post[is_vacancy]"
    end
  end
end
