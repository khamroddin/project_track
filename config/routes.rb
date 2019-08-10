Rails.application.routes.draw do


  get 'employees/index'

  devise_for :users
  get 'home/index'
  get "employees/index"
  get "employees/new_category"
  post "employees/new_category"
  get 'employees/edit_category/:id' => 'employees#edit_category', as: :emp_edit_cat
  post 'employees/edit_category/:id' => 'employees#edit_category', as: :emp_update_cat

  get "employees/new_position"
  post "employees/new_position"
  get 'employees/edit_position/:id' => 'employees#edit_position', as: :emp_edit_position
  post 'employees/edit_position/:id' => 'employees#edit_position', as: :emp_update_position
  get 'organization/new'
  post 'organization/new'
  get 'organization/new_location'
  post 'organization/new_location'
  post 'clients/create'
  resources :clients
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
  devise_scope :user do
    authenticated :user do
      root :to => 'home#index'
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
