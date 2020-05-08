Rails.application.routes.draw do
  get "tweets/search"
  get 'users/:id/toggle_activation', to: 'users#toggle_activation', as: 'toggle_activation'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets do
    resources :likes
  end
  
  
	
  namespace :api do
    resources :news, only: [:index, :create, :destroy, :update, :show]
    resources :dates, only: [:date]
  end

  get '/api/:date1/:date2', to: 'tweets#date', as: "date"

  get '/tweets/:id/retweets', to: 'tweets#retweets', as: 'retweets'
  get '/tweets/hashtag/:name', to: 'tweets#hashtags', as: 'hashtags'


  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tweets#index'
end


