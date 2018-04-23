Rails.application.routes.draw do

  root 'static#home'

  get 'static/about'

  get 'static/contact'

  get 'stocks/index'

  get 'stocks/show'

  get 'stocks/new'

  get 'stocks/edit'

  get '/stocks/destroy'

  get 'stocks/profile', to: 'users#profile'


  get '/stocks/search', to: 'stocks#search'

  devise_for :users

  #resources :stocks
end
