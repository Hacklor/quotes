Quotes::Application.routes.draw do
  namespace :backend do
    resources :quotes, except: :show
  end

  get 'random_quote', to: 'quotes#random'
  root 'quotes#random'
end
