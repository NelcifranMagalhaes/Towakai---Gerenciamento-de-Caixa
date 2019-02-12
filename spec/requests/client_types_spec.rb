require 'rails_helper'

RSpec.describe "ClientTypes", type: :request do
  describe "GET /client_types" do
    it "works! (now write some real specs)" do
      get client_types_path
      expect(response).to have_http_status(200)
    end
  end
end
