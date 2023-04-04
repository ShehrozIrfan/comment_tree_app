Rails.application.routes.draw do
  # for graphql
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  # default root route must exist for devise
  root 'comments#index'

  resources :comments do
    member do
      get 'show_reply_modal'
      get 'back'
    end
    collection do
      post 'reply'
    end
  end

  devise_for :users

  # api's
  namespace :api do
    namespace :v1 do
      resources :comments
    end
  end
end
