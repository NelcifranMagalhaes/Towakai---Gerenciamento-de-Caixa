require 'rails_helper'

RSpec.describe "product_specifications/new", type: :view do
  before(:each) do
    assign(:product_specification, ProductSpecification.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new product_specification form" do
    render

    assert_select "form[action=?][method=?]", product_specifications_path, "post" do

      assert_select "input[name=?]", "product_specification[name]"

      assert_select "textarea[name=?]", "product_specification[description]"
    end
  end
end
