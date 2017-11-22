Rails.application.routes.draw do
  devise_for :users
	resources :airports do
		resources :planes, only: [:new, :create]
	end	
	resources :planes, except: [:new, :create, :index] do
		resources :passengers, only: [:new, :create]
	end
	resources :passengers, except: [:new, :create, :index] do
		resources :bags, only: [:new, :create]
	end
	resources :bags, except: [:new, :create, :index]

	root 'airports#index'
end
