Rails.application.routes.draw do

  get '/admin/role/', to: 'role#index'

  get '/admin/role/new', to: 'admin/roles#new'

  get '/admin/role/edit', to: 'role#edit'

  get '/admin/role/remove', to: 'role#remove'

  get '/admin/menu/', to: 'menu#index'

  get '/admin/menu/edit', to: 'menu#edit'

  get '/admin/menu/remove', to: 'menu#remove'

  get '/admin/menu/new', to: 'menu#new'

  get '/admin/attachment/', to: 'attachment#index'

  get '/admin/attachment/new', to: 'attachment#new'

  get '/admin/attachment/edit', to: 'attachment#edit'

  get '/admin/attachment/remove', to: 'attachment#remove'

  get '/admin/page/', to: 'page#index'

  get '/admin/page/new', to: 'page#new'

  get '/admin/page/remove', to: 'page#remove'

  get '/admin/page/edit', to: 'page#edit'

  get '/admin/post/', to: 'post#index'

  get '/admin/post/new', to: 'post#new'

  get '/admin/post/remove', to: 'post#remove'

  get '/admin/post/edit', to: 'post#edit'

  get '/register', to: 'register#index'

  get '/admin', to: 'admin#index'
  get '/admin/updates', to: 'admin#updates'
  get '/admin/users', to: 'admin#users'

  #get '/', to: 'api#index', constraints: {subdomain: 'api'}

  devise_for :users
  root 'home#index'

  # BELOW IS FOR THE API SUBDOMAIN

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
