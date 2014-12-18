Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  authenticated :user do
    root :to => 'static_pages#home', :as => "authenticated_root"
  end
  root :to => "static_pages#home"

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users, only: [:show, :edit, :update]
  resources :quoteholders
  resources :lines
  resources :quote_products
  resources :sizes
  resources :shapes
  resources :covers
  resources :categories
  resources :line_items
  resources :carts
  resources :styles
  resources :series
  resources :colors
  resources :orders
  resources :messages
  resources :subscribers
  resources :quotecarts
  resources :quotes
  resources :purchases, :only => [:new, :create, :show, :update]
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
  get 'users/:id' => 'users#show'
  get 'contact'   => 'messages#new'
  #match '/store',     to: 'static_pages#home',    via: 'get'
  get 'store' => 'static_pages#home'
  get 'signup'    => 'users#new'
  get 'help'      => 'static_pages#help'
  get 'about'     => 'static_pages#about'
  get 'americlear_laminations_sample'   => 'static_pages#americlear_laminations_sample'
  get 'cleaning_instructions'   => 'static_pages#cleaning_instructions'
  get 'credit_application'   => 'static_pages#credit_application'
  get 'frequently_asked_questions'  => 'static_pages#frequently_asked_questions'
  get 'gallery' => 'static_pages#gallery'
  get 'free_swatches' => 'static_pages#free_swatches'
  get 'how_to_measure'   => 'static_pages#how_to_measure'
  get 'how_to_order'   => 'static_pages#how_to_order'
  get 'markets'   => 'static_pages#markets'
  get 'photo_gallery' => 'static_pages#photo_gallery'
  get 'place_an_order'   => 'static_pages#place_an_order'
  get 'privacy_policy'   => 'static_pages#privacy_policy'
  get 'request_catalog'   => 'static_pages#request_catalog'
  get 'request_quote'   => 'static_pages#request_quote'
  get 'roll_goods'   => 'static_pages#roll_goods'
  get 'satisfied_customers'   => 'static_pages#satisfied_customers'
  get 'sitemap'   => 'static_pages#sitemap'
  get 'table_cover_gallery' => 'static_pages#table_cover_gallery'
  get 'technical_specs'   => 'static_pages#technical_specs'
  get 'terms_and_conditions'   => 'static_pages#terms_and_conditions'
  get 'tradeshows' => 'static_pages#tradeshows'

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
