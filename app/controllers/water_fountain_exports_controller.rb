class WaterFountainExportsController < AdminController
  def show
    water_fountain_exporter = WaterFountainExporter.new(WaterFountain.all)
    respond_do do |format|
      format.csv { water_fountain_exporter.csv }
    end
  end
end
