Rails.application.routes.draw do
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
end
