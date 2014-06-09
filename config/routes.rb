Rails.application.routes.draw do
  devise_for :identities, path: 'users'

  root 'welcome#index'

  resources :tasks

end
