Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :surveys, only: %i[index show] do
        post 'answer'
        get 'result'
      end

      resources :survey_results, only: %i[index show]


      namespace :publishers do
        resources :surveys, only: %i[index show create update destroy] do 
          resources :questions, only: %i[index show create update destroy]
        end
      end
    end
  end

  mount_devise_token_auth_for 'Publisher', at: 'api/v1/publishers/auth'
end
