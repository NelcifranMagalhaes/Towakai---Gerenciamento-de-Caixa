require 'rails_helper'

RSpec.describe "client_types/edit", type: :view do
  before(:each) do
    @client_type = assign(:client_type, ClientType.create!(
      :name => "MyString",
      :tax_discount => 1.5
    ))
  end

  it "renders the edit client_type form" do
    render

    assert_select "form[action=?][method=?]", client_type_path(@client_type), "post" do

      assert_select "input[name=?]", "client_type[name]"

      assert_select "input[name=?]", "client_type[tax_discount]"
    end
  end
end
