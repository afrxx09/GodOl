class CreateLoggedBeers < ActiveRecord::Migration
  def change
    create_table :logged_beers do |t|
      t.integer :beer_id
      t.integer :user_id

      t.timestamps
    end
    add_index :logged_beers, [:beer_id, :user_id]
  end
end
