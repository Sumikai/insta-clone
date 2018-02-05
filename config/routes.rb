Rails.application.routes.draw do
  root 'pictures#top'
  
  resources :users
  resources :sessions, only: [:new, :create, :edit, :destroy]
  resources :favorites, only: [:create, :destroy]
  
  resources :pictures do
    collection do
      post :confirm
      get :favorite
      get :top
    end
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
