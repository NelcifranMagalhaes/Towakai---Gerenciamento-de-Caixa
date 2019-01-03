require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :value => 1.5,
      :cost_price => 1.5,
      :tax => 1.5,
      :sale_price => 1.5,
      :name => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[value]"

      assert_select "input[name=?]", "product[cost_price]"

      assert_select "input[name=?]", "product[tax]"

      assert_select "input[name=?]", "product[sale_price]"

      assert_select "input[name=?]", "product[name]"
    end
  end
end
