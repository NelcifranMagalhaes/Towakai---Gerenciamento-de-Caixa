require "rails_helper"

RSpec.describe ProductSpecificationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/product_specifications").to route_to("product_specifications#index")
    end

    it "routes to #new" do
      expect(:get => "/product_specifications/new").to route_to("product_specifications#new")
    end

    it "routes to #show" do
      expect(:get => "/product_specifications/1").to route_to("product_specifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_specifications/1/edit").to route_to("product_specifications#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/product_specifications").to route_to("product_specifications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_specifications/1").to route_to("product_specifications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_specifications/1").to route_to("product_specifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_specifications/1").to route_to("product_specifications#destroy", :id => "1")
    end
  end
end
