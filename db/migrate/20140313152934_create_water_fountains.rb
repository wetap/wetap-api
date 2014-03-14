class CreateWaterFountains < ActiveRecord::Migration
  def change
    create_table :water_fountains do |t|
      t.point :point, :srid => 4326

      t.timestamps
    end
  end
end
