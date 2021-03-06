Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :adverts, only: [:index, :show]

  authenticate :user, ->(u) { u.admin? } do
    namespace :admin do
      resources :adverts, only: %i[index]
    end
  end

  authenticate :user, ->(u) { u.client? } do
    namespace :client do
      resources :adverts, only: %i[index show]
    end
  end


  namespace :api do
    namespace :v1 do
      resources :adverts, only: %i[create update index show]
    end
  end
end
