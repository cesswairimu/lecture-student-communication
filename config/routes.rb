Rails.application.routes.draw do


root 'static_pages#home'
get 'edit' => 'users#edit'
get 'login' => 'sessions#new'
post 'login' => 'sessions#create'
delete 'logout' => 'sessions#destroy'
resources :users
resources :account_activations, only: [:edit]

end
