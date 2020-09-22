Rails.application.routes.draw do
  root 'assets#index'

  namespace :api do
    namespace :v1 do
      resources :assets, only: :index
    end
  end
end
