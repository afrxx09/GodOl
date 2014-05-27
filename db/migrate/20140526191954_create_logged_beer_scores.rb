class CreateLoggedBeerScores < ActiveRecord::Migration
  def change
    create_table :logged_beer_scores do |t|
      t.integer :logged_beer_id
      t.integer :appearance
      t.integer :aroma
      t.integer :pallate
      t.integer :flavour
      t.integer :overall

      t.timestamps
    end
    add_index :logged_beer_scores, [:logged_beer_id]
  end
end
