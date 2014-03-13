require 'spec_helper'

describe "WaterFountains" do
  describe "GET /water_fountains" do
    it "works! (now write some real specs)" do
      get water_fountains_path
      expect(response.status).to be(200)
    end
  end
end
