GodOl::Application.routes.draw do
  get "static_pages/start"
  get "static_pages/kontakt"
  get "static_pages/om"
  
  resources :brewery_contacts

  resources :contact_types

  resources :breweries

  
  root 'static_pages#start'
end
