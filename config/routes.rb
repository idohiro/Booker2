Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'homes#top'
   get 'home/about', to: 'homes#about'
       resources :users, path_names: {new: :signup}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :books,only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  end
   resources  :users, only: [:show, :edit,:index,:create]
end
