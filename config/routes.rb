Rails.application.routes.draw do
   devise_for :users
  get 'searches/serach'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get root to:'homes#top'
  get 'homes/about'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'relationships/follow'
    get 'relationships/follower'
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

end
