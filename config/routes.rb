Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "wellcome#index"

  mount Sidekiq::Web => "/sidekiq"
end
