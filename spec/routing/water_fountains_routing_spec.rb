require "spec_helper"

describe Api::V1::WaterFountainsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/water_fountains").to route_to("api/v1/water_fountains#index")
    end

    it "routes to #new" do
      expect(:get => "/api/v1/water_fountains/new").to route_to("api/v1/water_fountains#new")
    end

    it "routes to #show" do
      expect(:get => "/api/v1/water_fountains/1").to route_to("api/v1/water_fountains#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/api/v1/water_fountains/1/edit").to route_to("api/v1/water_fountains#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/api/v1/water_fountains").to route_to("api/v1/water_fountains#create")
    end

    it "routes to #update" do
      expect(:put => "/api/v1/water_fountains/1").to route_to("api/v1/water_fountains#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/water_fountains/1").to route_to("api/v1/water_fountains#destroy", :id => "1")
    end

  end
end
