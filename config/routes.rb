Quotes::Application.routes.draw do
  namespace :backend do
    resources :quotes
  end

  get 'random_quotes', to: 'quotes#random'
end
