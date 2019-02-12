require 'rails_helper'

RSpec.describe "client_types/new", type: :view do
  before(:each) do
    assign(:client_type, ClientType.new(
      :name => "MyString",
      :tax_discount => 1.5
    ))
  end

  it "renders new client_type form" do
    render

    assert_select "form[action=?][method=?]", client_types_path, "post" do

      assert_select "input[name=?]", "client_type[name]"

      assert_select "input[name=?]", "client_type[tax_discount]"
    end
  end
end
