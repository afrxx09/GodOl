GodOl::Application.routes.draw do
	root 'static_pages#start'
	
	match '/kontakt', to: 'static_pages#kontakt', via: 'get'
	match '/om', to: 'static_pages#om', via: 'get'

	resources :brewery_contacts
	resources :contact_types
	resources :breweries
end
