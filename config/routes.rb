Rails.application.routes.draw do
  # get 'stories/index'
  # get '/stories' => 'stories#index'
  namespace :api do
    namespace :v1 do
      resources :stories, only: [:index, :create, :destroy]
    end
  end
end
