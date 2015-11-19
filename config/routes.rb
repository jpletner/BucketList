Rails.application.routes.draw do

    devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
    match('/adventures/get_random_adventure', {:via => :get, :to => 'adventures#get_random_adventure'})
    match('/adventures/:id/add_comment' , {:via => :post, :to => 'adventures#add_comment'})
    match('/adventures/:id/add_tag' , {:via => :post, :to => 'adventures#add_tag'})
    match('/users/search_users' , {:via => :get, :to => 'users#search_users'})
    match('users/show' , {:via => :get, :to => 'users#show'})
    match('users/show/newPic' , {:via => :get, :to => 'users#newPic'})
    match('users/show/cancel' , {:via => :get, :to => 'users#cancel'})
    match('users/show/addUserPicture' , {:via => :post, :to => 'users#addUserPicture'})
    match('users/:id/followUser' , {:via => :get, :to => 'users#followUser'})
    match('users/:id/unfollowUser' , {:via => :get, :to => 'users#unfollowUser'})
    match('users/show/followPage' , {:via => :get, :to => 'users#followPage'})
    match('users/all', {:via => :get, :to => 'users#index'})
    match('users/:id' , {:via => :get, :to => 'users#view_profile'})
    match('/users/:id/add_adventure' , {:via => :post, :to => 'users#add_adventure'})
    match('/adventures/search_adventures' , {:via => :get, :to => 'adventures#search_adventures'})

    
#  Rails.application.routes.draw do
    resources :migrations
    resources :pictures
    resources :adventures

#      devise_for :users, controllers: {
#        sessions: 'users/sessions'
#      }
#  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
    match '/', :via => [:get], :to => redirect('/bucket_list_index.html')
  # You can have the root of your site routed with "root"
    root 'adventures#index'

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
