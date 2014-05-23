class WaterFountain < ActiveRecord::Base
  validates :location, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                            :storage => :s3,
                            :s3_credentials => 'config/aws-credentials.yml',
                            :s3_host_name => "s3-us-west-2.amazonaws.com"


  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  scope :bounded_by, ->(bbox_params) do
    where_clause = "ST_Intersects(location, ST_MakeEnvelope(?, 4326))"
    if WaterFountain.bbox_crosses_dateline(bbox_params)
      l_box = [bbox_params[0], bbox_params[1], 180, bbox_params[3]]
      r_box = [-180, bbox_params[1], bbox_params[2], bbox_params[3]]

      where("#{where_clause} OR #{where_clause}", l_box, r_box)

    else
      where(where_clause, bbox_params)
    end
  end

  def location=(val)
    val = val.deep_stringify_keys if val.class == Hash
    self[:location] = RGeo::GeoJSON.decode(val).to_s
  end

  def location
    RGeo::GeoJSON.encode(self[:location])
  end

  def image_url
    return nil if image.blank?
    image.url
  end

  def self.generate_image_filename
    SecureRandom.uuid + '.jpg'
  end

  private

  def self.bbox_crosses_dateline(bbox_params)
    return false unless bbox_params.class == Array && bbox_params.count == 4

    lhs = bbox_params[0]
    rhs = bbox_params[2]

    lhs_in_eastern = lhs >= 0 && rhs <= 180
    rhs_in_western = rhs <= 0 && rhs >= -180

    # TODO, because we derive the bbox from the google map api viewport
    # we don't handle the case e.g in the eastern hemi that lhs > rhs
    lhs_in_eastern && rhs_in_western
  end

end
