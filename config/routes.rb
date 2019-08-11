Rails.application.routes.draw do
  resources :work_experiences do
    collection do
      get 'tag_index'
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    post :confirm, action: :confirm_new, on: :new
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
