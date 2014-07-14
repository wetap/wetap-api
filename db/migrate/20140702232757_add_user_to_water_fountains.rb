class AddUserToWaterFountains < ActiveRecord::Migration
  def change
    add_column :water_fountains, :user_id, :integer
    add_index :water_fountains, :user_id
  end
end
