class WaterFountain < ActiveRecord::Base
  validates :location, presence: true

  # TODO support international dateline
  scope :bounded_by, ->(bbox_string) { where("ST_Intersects(location, ST_MakeEnvelope(?, 4326))", self.bounding_box_from(bbox_string)) }

  def location=(val)
    self[:location] = RGeo::GeoJSON.decode(val).to_s
  end

  def location
    RGeo::GeoJSON.encode(self[:location])
  end

  private

  def self.bounding_box_from(param)
    bbox_params = param.split(',').map {|v| v.to_f }
    if bbox_params.length > 4 || bbox_params.length < 4
      raise RuntimeError, "bbox formatted incorrectly", caller
    end
    bbox_params
  end


end
