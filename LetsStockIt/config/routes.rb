Rails.application.routes.draw do
  get 'stocks/index'

  get 'stocks/show'

  get 'stocks/new'

  get 'stocks/edit'

  get '/stocks/destroy'
  #, to: 'stocks#destroy'

  get '/stocks/search', to: 'stocks#search'


  devise_for :users

  #resources :stocks
end
