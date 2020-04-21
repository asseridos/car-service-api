Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars
    end
  end

  root to: 'api/v1/cars#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
