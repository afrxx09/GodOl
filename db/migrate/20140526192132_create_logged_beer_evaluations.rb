class CreateLoggedBeerEvaluations < ActiveRecord::Migration
  def change
    create_table :logged_beer_evaluations do |t|
      t.integer :logged_beer_id
      t.integer :body
      t.integer :linger
      t.integer :bitter
      t.integer :sour
      t.integer :sweet
      t.integer :fruity
      t.integer :floral
      t.integer :hoppy
      t.integer :spicy
      t.integer :malty
      t.integer :toffee
      t.integer :burnt
      t.integer :chocolate
      t.integer :sulphury
      t.integer :carbonation

      t.timestamps
    end
    
    add_index :logged_beer_evaluations, [:logged_beer_id]
  end
end
