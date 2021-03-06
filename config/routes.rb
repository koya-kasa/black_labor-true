Rails.application.routes.draw do
  get 'questions/new'
  root to: 'work_experiences#index'
  resources :work_experiences do
    resources :likes, only: [:create, :destroy]
    resources :work_experience_comments, only: [:create]
    resources :work_experience_looked_histories, only: [:destroy]
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
  resources :questions, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
