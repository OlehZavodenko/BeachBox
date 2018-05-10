Rails.application.routes.draw do
  get '/products/new' => 'products#new'
  post 'products' => 'products#create'
  get '/buildbox' => 'pages#buildbox'
  get 'pages/secret'
	root to: 'users#new'
	get 'users/new' => 'users#new', as: :new_user
	post 'users' => 'users#create'

	# log in page with form:
	get '/login'     => 'sessions#new'

	# create (post) action for when log in form is submitted:
	post '/login'    => 'sessions#create'

	# delete action to log out:
	delete '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
