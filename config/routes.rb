Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


#root route
#get"/", to:"main#index"
root to: "main#index"

  #Get /about
  get "about-us", to:"about#index", as: :about


  #signup route
  get "sign_up", to: "registrations#new"
  post "sign_up", to:"registrations#create"


  #delete route

  delete "logout", to:"sessions#destroy"


  #sign in route
  get "sign_in", to: "sessions#new"
  post "sign_in", to:"sessions#create"



  #password

  get "password", to:"passwords#edit" , as: :edit_password
  patch "password", to: "passwords#update"


  get "password/reset", to: "password_resets#new"
  post "password/reset" , to: "password_resets#create"


  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
 




  # Defines the root path route ("/")
  # root "posts#index"
end
