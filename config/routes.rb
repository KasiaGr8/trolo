Rails.application.routes.draw do
  resources :boards do
    resources :lists, only: [:new, :create, :edit, :show, :destroy, :update]
  end # poprzez podanie resources konfiguruje automatycznie ścieżki, only po aby robić po kolei, bo inaczej stworzy caly komplet

  resources :lists, only: [] do
    resources :tickets, only: [:new, :create, :edit, :update]
  end 

  resources :sessions, only: [:new, :create, :destroy]
  resources :registrations, only: [:new, :create]
end