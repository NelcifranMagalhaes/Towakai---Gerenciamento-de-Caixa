require "rails_helper"

RSpec.describe ClientTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/client_types").to route_to("client_types#index")
    end

    it "routes to #new" do
      expect(:get => "/client_types/new").to route_to("client_types#new")
    end

    it "routes to #show" do
      expect(:get => "/client_types/1").to route_to("client_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/client_types/1/edit").to route_to("client_types#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/client_types").to route_to("client_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/client_types/1").to route_to("client_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/client_types/1").to route_to("client_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/client_types/1").to route_to("client_types#destroy", :id => "1")
    end
  end
end
