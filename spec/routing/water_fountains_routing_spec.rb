require "spec_helper"

describe WaterFountainsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/water_fountains").to route_to(:format => :json, :controller => "water_fountains", :action => "index")
    end

    it "routes to #new" do
      expect(:get => "/water_fountains/new").to route_to(:format => :json, :controller => "water_fountains", :action =>"new")
    end

    it "routes to #show" do
      expect(:get => "/water_fountains/1").to route_to(:format => :json, :controller => "water_fountains", :action =>"show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/water_fountains/1/edit").to route_to(:format => :json, :controller => "water_fountains", :action =>"edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/water_fountains").to route_to(:format => :json, :controller => "water_fountains", :action =>"create")
    end

    it "routes to #update" do
      expect(:put => "/water_fountains/1").to route_to(:format => :json, :controller => "water_fountains", :action =>"update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/water_fountains/1").to route_to(:format => :json, :controller => "water_fountains", :action =>"destroy", :id => "1")
    end

  end
end
