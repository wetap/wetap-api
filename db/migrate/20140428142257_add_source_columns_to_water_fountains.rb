class AddSourceColumnsToWaterFountains < ActiveRecord::Migration
  def change

    add_column :water_fountains, :data_source, :string
    add_column :water_fountains, :data_source_id, :string
    add_index :water_fountains, [:data_source, :data_source_id], unique: true

    add_column :water_fountains, :import_source, :string

  end
end
