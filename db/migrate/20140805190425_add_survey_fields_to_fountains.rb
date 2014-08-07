class AddSurveyFieldsToFountains < ActiveRecord::Migration
  def change
    add_column :water_fountains, :working, :boolean
    add_column :water_fountains, :dog_bowl, :boolean
    add_column :water_fountains, :filling_station, :boolean
    add_column :water_fountains, :flow, :string
  end
end
