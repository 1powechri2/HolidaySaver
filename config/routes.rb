Rails.application.routes.draw do
  get '/', to: 'root#show'
  post '/sign_up', to: 'sign_up#create'
  post '/log_in', to: 'log_in#login'
  post '/delete_user', to: 'log_in#delete'

  namespace :api do
    namespace :v1 do
      get '/holidays', to: 'holiday#index'
    end
  end
end
