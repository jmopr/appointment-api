Rails.application.routes.draw do
  resources :appointments, :except => [:new, :edit]
end
