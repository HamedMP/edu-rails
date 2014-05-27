require 'spec_helper'

describe "categories/edit", :type => :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :title => "MyString",
      :slug => "MyString",
      :order => 1,
      :category => nil
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_title[name=?]", "category[title]"

      assert_select "input#category_slug[name=?]", "category[slug]"

      assert_select "input#category_order[name=?]", "category[order]"

      assert_select "select#category_category_id[name=?]", "category[category_id]"
    end
  end
end
