Rails.application.routes.draw do
  root "schedules#show"
  resources :schedules, only: [:show, :new, :edit, :create, :update, :destroy] do
    resources :answers, only: [:create, :destroy]
  end
end
