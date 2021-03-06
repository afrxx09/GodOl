Rails.application.routes.draw do
  resources :breweries do
    resources :brewery_contacts
  end
  
  resources :beers
  resources :beer_types, except: [ :show, :edit, :new ]
  resources :contact_types, except: [ :show, :edit, :new ]
  
  resources :logged_beers, only: [ :index, :show, :new, :create ]
  get 'new_beer_log/:id/' => 'logged_beers#new', as: :new_beer_log
  post 'new_beer_log/:id/create' => 'logged_beers#create', as: :create_beer_log
  
  resources :users, except: [ :show ]
  get 'users/:id/toggle_admin' => 'users#toggle_admin', as: :toggle_admin
  
  resources :sessions, only: [ :new, :create, :destroy]
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

  root 'static_pages#start'
  
  match '/beer_me', to: 'static_pages#beer_me', via: 'get'

  match '/signup', to: 'users#new', via: 'get'
  match '/start', to: 'static_pages#start', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/beer_list', to: 'static_pages#beer_list', via: 'get'
  match '/brewery_list', to: 'static_pages#brewery_list', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
