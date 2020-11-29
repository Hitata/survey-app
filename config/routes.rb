Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :surveys
      namespace :publishers do
        resources :surveys, only: %i[index show create update delete] do 
          resources :questions, only: %i[show create update delete]
        end
        mount_devise_token_auth_for 'Publisher', at: 'auth'
      end
    end
  end
end
