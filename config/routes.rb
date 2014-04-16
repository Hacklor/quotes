Quotes::Application.routes.draw do
  namespace :backend do
    resources :quotes, except: :show
  end

  get 'random_quotes', to: 'quotes#random'
end
