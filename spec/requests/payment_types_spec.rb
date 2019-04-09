require 'rails_helper'

RSpec.describe "PaymentTypes", type: :request do
  describe "GET /payment_types" do
    it "works! (now write some real specs)" do
      get payment_types_path
      expect(response).to have_http_status(200)
    end
  end
end
