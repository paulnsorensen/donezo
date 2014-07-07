Rails.application.routes.draw do
  devise_for :identities, path: 'users'

  root 'welcome#index'

  resources :tasks, except: [:new] do
    post 'send_task_list', on: :collection
  end
end
