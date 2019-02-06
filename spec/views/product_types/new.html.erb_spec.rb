require 'rails_helper'

RSpec.describe "product_types/new", type: :view do
  before(:each) do
    assign(:product_type, ProductType.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new product_type form" do
    render

    assert_select "form[action=?][method=?]", product_types_path, "post" do

      assert_select "input[name=?]", "product_type[name]"

      assert_select "textarea[name=?]", "product_type[description]"
    end
  end
end
