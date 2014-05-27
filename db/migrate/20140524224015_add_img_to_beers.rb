class AddImgToBeers < ActiveRecord::Migration
  def change
	add_column :beers, :img_file_name, :string
	add_column :beers, :img_content_type, :string
	add_column :beers, :img_file_size, :integer
	add_column :beers, :img_updated_at, :datetime
  end
end
