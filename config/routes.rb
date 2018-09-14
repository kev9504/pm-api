Rails.application.routes.draw do
  
  resources :users
  resources :projects do 
      resources :tasks
  end
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"
  get '/profile' => "users#profile"
  delete '/profile' => "users#delete"
  
end
