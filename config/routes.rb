StackFlow::Application.routes.draw do
  get "sessions/new"

  get "sessions/create"

  devise_for :admins

  mount Ckeditor::Engine => '/ckeditor'

  #chat_routes
  post '/new_message' => 'chats#new_message', :as => :new_message
  match 'chats/select_chat_friend/:id' => 'chats#select_chat_friend'

  #get  '/login' => 'sessions#new', :as => :login
  #post '/login' => 'sessions#create', :as => :login

  #get  '/chatroom' => 'chats#room', :as => :chat
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  root :to => "questions#full_view"
  match 'answers/user_chance_question' => 'answers#user_chance_question'
  match 'questions/points/:id' => 'questions#points'
  match 'questions/unlike/:id' => 'questions#unlike'
  match 'questions/full_view' => 'questions#full_view'
  match 'questions/per_subject_questions/:id' => 'questions#per_subject_questions'
  match 'questions/tags' => 'questions#tags', :as=>:question_tags
  match 'questions/tag_search' => 'questions#tag_search'
  match 'chats/chating_status' => 'chats#chating_status'
  #match 'chats/all_admins_in_chat' => 'chats#all_admins_in_chat'

#  match 'questions/un_answered' => 'questions#index'
  resources :chats do
        collection do
           get 'admin_search'
        end
  end
  resources :questions
  resources :answers do
        member do
           post 'create_user_comment'
        end
  end

  resources :comments
  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

