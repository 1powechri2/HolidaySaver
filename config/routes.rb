Rails.application.routes.draw do
  get '/', to: 'root#show'
  post '/sign_up', to: 'sign_up#create'
  post '/log_in', to: 'log_in#login'
end
