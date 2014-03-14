class WaterFountain < ActiveRecord::Base
  validates :location, presence: true

  def location=(val)
    self[:location] = RGeo::GeoJSON.decode(val).to_s
  end

  def location
    RGeo::GeoJSON.encode(self[:location])
  end
end
