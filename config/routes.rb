Zapdelivery::Application.routes.draw do

  resources :templates do
    resources :outboxes
  end

  root 'shipments#index'

  match '/datasources/show/:id' => 'datasources#show', as: 'datasource_show', via: :get


  match "/attachment/view/:id" => "attachment#view", :as => 'attachment_view', :via => :get
  match "/attachment/render/:id" => "attachment#inline", :as => 'attachment_render', :via => :get
  match "/attachment/download/:id" => "attachment#download", :as => 'attachment_download', :via => :get


  resources :inboxes

  resources :shipments

  resources :assignments

  resources :accounts

  resources :channels

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  resources :admins

  devise_for :users
    resources :customers do
      resources :departments, shallow: :true
    end

  get "admin" => "users#index"


  resources :outboxes

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
