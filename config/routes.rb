Rails.application.routes.draw do
  # get 'stories/index'
  # get '/stories' => 'stories#index'
  namespace :api do
    namespace :v1 do
      resources :stories, only: [:create, :destroy]

      resources :stories, shallow: true do
        collection do
          get 'top_stories'
        end
        member do
          post 'review'
        end
      end
      resources :users do
        resources :stories, shallow: true
      end
    end
  end
end
