class WaterFountain < ActiveRecord::Base
  validates :location, presence: true

  # TODO support international dateline
  scope :bounded_by, ->(bbox_params) { where("ST_Intersects(location, ST_MakeEnvelope(?, 4326))", bbox_params) }

  def location=(val)
    self[:location] = RGeo::GeoJSON.decode(val).to_s
  end

  def location
    RGeo::GeoJSON.encode(self[:location])
  end

end
