require 'csv'

class WaterFountainExporter
  def initialize(water_fountains)
    @water_fountains = water_fountains || []
  end

  def csv
    if @water_fountains.first
      headers = @water_fountains.first.for_export.keys
    else
      headers = []
    end
    CSV.generate(headers: headers, write_headers: true) do |csv_string|
      @water_fountains.each do |water_fountain|
        csv_string << water_fountain.for_export
      end
    end
  end
end
