require 'rails_helper'

RSpec.describe "client_types/index", type: :view do
  before(:each) do
    assign(:client_types, [
      ClientType.create!(
        :name => "Name",
        :tax_discount => 2.5
      ),
      ClientType.create!(
        :name => "Name",
        :tax_discount => 2.5
      )
    ])
  end

  it "renders a list of client_types" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
