Rails.application.routes.draw do

  scope "/:locale" do
    resources :events
    resources :players
    get '/events/:id/add_player' => 'events#add_player'
    delete '/events/:id/remove_player' => 'events#remove_player'
  end

  devise_for :users

  root 'events#index'

  get '/:locale' => 'events#index'
  
end
