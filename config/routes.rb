Rails.application.routes.draw do
  resources :users
  resources :user_on_tasks
  # Routes for the User on task resource:
  root "groups#index"
  # CREATE
  post("/insert_user_on_task", { :controller => "user_on_tasks", :action => "create" })
          
  # READ
  get("/user_on_tasks", { :controller => "user_on_tasks", :action => "index" })
  
  get("/user_on_tasks/:path_id", { :controller => "user_on_tasks", :action => "show" })
  
  # UPDATE
  
  post("/modify_user_on_task/:path_id", { :controller => "user_on_tasks", :action => "update" })
  
  # DELETE
  get("/delete_user_on_task/:path_id", { :controller => "user_on_tasks", :action => "destroy" })

  #LOGOUT
  post("/logout", controller: "users", action: "destroy_user_session" )

  #------------------------------

  resources :user_in_groups
  resources :invitations
  resources :groups
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
