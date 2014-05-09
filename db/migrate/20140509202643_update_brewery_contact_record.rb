class UpdateBreweryContactRecord < ActiveRecord::Migration
  def change
  	add_column :brewery_contacts, :brewery_id, :integer
  	add_column :brewery_contacts, :contact_type_id, :integer
  end
end
