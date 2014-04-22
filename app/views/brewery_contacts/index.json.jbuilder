json.array!(@brewery_contacts) do |brewery_contact|
  json.extract! brewery_contact, :id, :brewery_id, :contact_type_id, :brewery_contact
  json.url brewery_contact_url(brewery_contact, format: :json)
end
