class AddDetailsToBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :homepage, :string
    add_column :breweries, :established, :string
  end
end
