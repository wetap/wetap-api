require 'spec_helper'

describe "WaterFountains" do
  describe "GET /water_fountains.json" do
    it "should return 200" do
      get water_fountains_path(format: :json)
      expect(response.status).to be(200)
    end
  end
end
