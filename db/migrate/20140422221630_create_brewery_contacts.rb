class CreateBreweryContacts < ActiveRecord::Migration
  def change
    create_table :brewery_contacts do |t|
      t.integer :brewery_id
      t.integer :contact_type_id
      t.string :brewery_contact

      t.timestamps
    end
  end
end
