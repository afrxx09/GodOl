class AddSystembolagetArtNrToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :systembolaget, :integer
  end
end
