require 'spec_helper'

describe "categories/new", :type => :view do
  before(:each) do
    assign(:category, build(:category))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_title[name=?]", "category[title]"

      assert_select "input#category_slug[name=?]", "category[slug]"

      assert_select "input#category_order[name=?]", "category[order]"

      assert_select "select#category_category_id[name=?]", "category[category_id]"
    end
  end
end
