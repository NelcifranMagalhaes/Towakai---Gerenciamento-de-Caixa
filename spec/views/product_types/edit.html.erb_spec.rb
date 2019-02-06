require 'rails_helper'

RSpec.describe "product_types/edit", type: :view do
  before(:each) do
    @product_type = assign(:product_type, ProductType.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit product_type form" do
    render

    assert_select "form[action=?][method=?]", product_type_path(@product_type), "post" do

      assert_select "input[name=?]", "product_type[name]"

      assert_select "textarea[name=?]", "product_type[description]"
    end
  end
end
