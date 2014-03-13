class RenamePointToLocation < ActiveRecord::Migration
  def change
    rename_column :water_fountains, :point, :location
  end
end
