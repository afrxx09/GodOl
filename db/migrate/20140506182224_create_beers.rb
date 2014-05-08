class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.integer :brewery_id
      t.integer :beer_type_id
      t.string :name
      t.float :abv
      t.integer :ibu
      t.integer :ebc

      t.timestamps
    end
  end
end
