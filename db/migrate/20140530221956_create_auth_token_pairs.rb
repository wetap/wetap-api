class CreateAuthTokenPairs < ActiveRecord::Migration
  def change
    create_table :auth_token_pairs do |t|
      t.string :public_token
      t.string :private_token
      t.integer :user_id

      t.timestamps
    end
  end
end
