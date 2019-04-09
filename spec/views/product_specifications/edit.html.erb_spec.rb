require 'rails_helper'

RSpec.describe "product_specifications/edit", type: :view do
  before(:each) do
    @product_specification = assign(:product_specification, ProductSpecification.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit product_specification form" do
    render

    assert_select "form[action=?][method=?]", product_specification_path(@product_specification), "post" do

      assert_select "input[name=?]", "product_specification[name]"

      assert_select "textarea[name=?]", "product_specification[description]"
    end
  end
end
