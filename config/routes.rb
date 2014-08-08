Rails.application.routes.draw do

  scope "(:locale)", locale: ["en"] do
    resources :players
  end

  devise_for :users

  root 'players#index'

  get '/:locale' => 'players#index'
end