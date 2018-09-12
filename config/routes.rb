Rails.application.routes.draw do
  resources :projects do 
      :tasks
  end
end
