Rails.application.routes.draw do
  root 'welcome#index'

  resources :comments do
    member do
      put :like
    end
  end
end
