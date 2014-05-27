class AddImgToBreweries < ActiveRecord::Migration
  def change
  	add_column :breweries, :img_file_name, :string
	add_column :breweries, :img_content_type, :string
	add_column :breweries, :img_file_size, :integer
	add_column :breweries, :img_updated_at, :datetime
  end
end