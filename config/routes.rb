Rails.application.routes.draw do
  # get 'admin/index'
  get 'admin' => 'admin#index'  # is this line is alternate of above line???

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  ### The Above block is added and the above block has replaced this block ###
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  # :local is in paranthesis, this is a way to say that :local is optional
  scope '(:locale)' do
    resources :users
    # resources :user 
    resources :orders
    resources :line_items
    resources :carts
    # get 'store/index' # commented when I added "scope '(:locale)' do"

    # resources :products # commented when I added "scope '(:locale)' do"

    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    # root 'welcome#index'
    resources :products do
      get :who_bought, :on => :member
    end
    root :to => 'store#index', :as => 'store' # This line is added to make the root and/or default route...!!!
  end

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
