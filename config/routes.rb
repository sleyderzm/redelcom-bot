Rails.application.routes.draw do
  resources :chatbot, only: [:index] do
    post 'render_user_message', on: :collection
    post 'render_bot_response', on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
