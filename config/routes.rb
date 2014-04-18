Quotes::Application.routes.draw do
  namespace :backend do
    resources :quotes, except: :show
    post 'twitter/tweet' => 'twitter#tweet'

    root 'quotes#index'
  end

  get 'random_quote', to: 'quotes#random'
  root 'quotes#random'
end
