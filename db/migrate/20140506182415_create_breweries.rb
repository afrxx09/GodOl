class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :nationality
      t.string :description
      
      t.timestamps
    end
  end
end
