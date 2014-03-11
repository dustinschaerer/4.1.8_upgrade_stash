Americo::Application.routes.draw do
  
 

  resources :quotes

  resources :purchases

  authenticated :user do
    root :to => 'static_pages#home', :as => "authenticated_root"
  end
  root :to => "static_pages#home"

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :users, only: [:show, :edit, :update]
  resources :categories
  resources :line_items
  resources :carts
  resources :styles
  resources :series
  resources :colors
  resources :orders
  resources :shipping_profiles

  resources :laminatecuts
  resources :vinylcuts
  resources :upholsterycuts
  resources :upholsteryrolls
  resources :vinylpads
  resources :nonslipcuts
  resources :nonslippads
  resources :americlears
  resources :frogs
  resources :messages
  resources :subscribers
  resources :laminaterolls
  resources :laminates
  resources :vinylrolls
  resources :items
  resources :quotecarts
  resources :vinyls

  get "store/index"
  resources :products do
    get :who_bought, on: :member
  end
  resources :series do
    get :who_bought, on: :member
  end
  
  resources :colors do
    get :who_bought, on: :member
  end
  
  get "users/new"

  match '/users/:id', to: 'users#show',           via: 'get' 
  match '/contact',   to: 'messages#new',         via: 'get'
  match '/store',     to: 'store#index',          via: 'get'
  match '/signup',    to: 'users#new',            via: 'get'
  match '/help',      to: 'static_pages#help',    via: 'get'
  match '/about',     to: 'static_pages#about',   via: 'get'
 # match '/contact',   to: 'static_pages#contact', via: 'get'
  match '/americlear_laminations_sample',   to: 'static_pages#americlear_laminations_sample', via: 'get'
  match '/cleaning_instructions',   to: 'static_pages#cleaning_instructions', via: 'get'
  match '/credit_application',   to: 'static_pages#credit_application', via: 'get'
  match '/frequently_asked_questions',  to: 'static_pages#frequently_asked_questions',   via: 'get'
  match '/gallery', to: 'static_pages#gallery', via: 'get'
  match '/free_swatches', to: 'static_pages#free_swatches', via: 'get'
  match '/how_to_measure',   to: 'static_pages#how_to_measure', via: 'get'
  match '/how_to_order',   to: 'static_pages#how_to_order', via: 'get'
  match '/markets',   to: 'static_pages#markets', via: 'get'
  match '/photo_gallery', to: 'static_pages#photo_gallery', via: 'get'
  match '/place_an_order',   to: 'static_pages#place_an_order', via: 'get'
  match '/privacy_policy',   to: 'static_pages#privacy_policy', via: 'get'
  match '/request_catalog',   to: 'static_pages#request_catalog', via: 'get'
  match '/request_quote',   to: 'static_pages#request_quote', via: 'get'
  match '/satisfied_customers',   to: 'static_pages#satisfied_customers', via: 'get'
  match '/sitemap',   to: 'static_pages#sitemap', via: 'get'
  match '/table_cover_gallery', to: 'static_pages#table_cover_gallery', via: 'get'
  match '/technical_specs',   to: 'static_pages#technical_specs', via: 'get'
  match '/terms_and_conditions',   to: 'static_pages#terms_and_conditions', via: 'get'
  match '/tradeshows', to: 'static_pages#tradeshows', via: 'get'
  
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
