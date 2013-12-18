Simulator::Application.routes.draw do
  resources :organizations
  resources :stuffs

  resources :rooms do
    member do
      post :add_device
      delete :delete_device
    end
  end

  resources :devices do
    member do
      get :conditions
    end
  end

  resources :operations
  wash_out :web_service
  wash_out :information
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'rooms#index'

  # Example of regular route:
    get 'manage_simulation' => 'application#manage_simulation'
    get 'log' => 'application#log'
    get 'simulation' => 'application#simulation'
    post 'simulation' => 'application#submit_simulation'
    post 'add_person' => 'rooms#add_person'
    delete 'delete_person' => 'rooms#delete_person'
    get 'edit_device_room/:device_room_id' => 'devices#edit_device_room', :as => 'edit_device_room'
    put 'edit_device_room/:device_room_id' => 'devices#update_device_room', :as => 'update_device_room'
    get 'edit_person/:person_id' => 'application#edit_person', :as => 'edit_person'
    put 'edit_person/:person_id' => 'application#update_person', :as => 'update_person'
    get 'reload' => 'application#reload'
    get 'update_status' => 'devices#update_status'

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