Rails.application.routes.draw do
  resources :users
  get '/projects/projects_length'=>'projects#projects_length'
  post '/projects/contact'=>'projects#contact'
  #pending to add source for marketing analysis
  resources :projects do 
      resources :tasks
      resources :activities
  end
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"
  get '/profile' => "users#profile"
  delete '/profile' => "users#delete"
end
