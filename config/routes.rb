GodOl::Application.routes.draw do
  resources :brewery_contacts

  resources :contact_types

  resources :breweries

  get "welcome/index"
  
  root 'welcome#index'
end
