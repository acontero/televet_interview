# == Route Map

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets, only: [:index, :show]

  get '*path' => redirect('/404.html')
end
