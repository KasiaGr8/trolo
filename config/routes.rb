Rails.application.routes.draw do
  resources :boards # poprzez podanie resources konfiguruje automatycznie ścieżki, only po aby robić po kolei, bo inaczej stworzy caly komplet
end