Rails.application.routes.draw do

  scope "/:locale" do
    resources :events
    resources :players
    get '/events/:id/add_player' => 'events#add_player'
  end

  devise_for :users

  root 'players#index'

  get '/:locale' => 'players#index'


  
end
