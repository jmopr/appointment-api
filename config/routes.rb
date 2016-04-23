Rails.application.routes.draw do
  # Api definition
  namespace :api do, defaults: { format: :json } do,
                              constraints: { subdomain: 'api' }, path: '/'  do
    # We are going to list our resources here
    resources :appointments , :except => [:new, :edit]
  end
end
