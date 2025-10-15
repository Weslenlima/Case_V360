Rails.application.routes.draw do
  root "sessions#new"

  # Sessões (Login/Logout)
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  # Usuários
  resources :users, only: %i[new create]

  # Listas e tarefas
  resources :lists do
    resources :todos, only: %i[create update destroy] do
      patch :toggle, on: :member
    end
  end
end
