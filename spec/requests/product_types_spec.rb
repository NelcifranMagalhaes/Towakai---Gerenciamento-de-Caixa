require 'rails_helper'

RSpec.describe "ProductTypes", type: :request do
  describe "GET /product_types" do
    it "works! (now write some real specs)" do
      get product_types_path
      expect(response).to have_http_status(200)
    end
  end
end
