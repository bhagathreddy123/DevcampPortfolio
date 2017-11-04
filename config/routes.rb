Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  root 'pages#homepage'
  get "contact", to: "pages#contact"
  get "about-me", to: "pages#about"
  get "portfolio/:id", to: 'portfolios#show',as: 'portfolio_show'
  resources :blogs do 
  	member do
  		get :toggle_status
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
