Rails.application.routes.draw do
  resources :breweries do
    resources :brewery_contacts
  end
  
  resources :beers, except: :show
  resources :beer_types, except: [ :show, :edit, :index ]
  resources :contact_types, except: [ :show, :edit, :index ]
  
  resources :users, except: [ :show, :index ]

  root 'static_pages#start'

  match '/signup', to: 'users#new', via: 'get'
  match '/start', to: 'static_pages#start', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/beer_list', to: 'static_pages#beer_list', via: 'get'
  match '/brewery_list', to: 'static_pages#brewery_list', via: 'get'
  
  #get 'beer_types', to: 'beer_types#index'
  #get 'beer_type', to: 'beer_types#index'
  #get 'beer_type/new', to: 'beer_types#new'
  #post 'beer_type', to: 'beer_types#create'
  #get 'beer_type/:id/edit', to: 'beer_types#edit', as: 'beer_type_edit'
  #patch 'beer_type', to: 'beer_types#update'
  #delete 'beer_type', to: 'beer_types#destroy'

  #get 'contact_types', to: 'contact_types#index'
  #get 'contact_type', to:  'contact_types#index'
  #get 'contact_types/new', to: 'contact_types#new'
  #post 'contact_types', to: 'contact_types#create'
  #get 'contact_types/:id/edit', to: 'contact_types#edit', as: 'contact_type_edit'
  #patch 'contact_types', to: 'contact_types#update'
  #delete 'contact_types', to: 'contact_types#destroy'

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
