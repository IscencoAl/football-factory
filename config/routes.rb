Rails.application.routes.draw do

  scope "/:locale" do
    resources :events
    resources :players
  end

  devise_for :users

  root 'players#index'

  get '/:locale' => 'players#index'
  
end
