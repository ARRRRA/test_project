Rails.application.routes.draw do

	root 'books#index'

	resources :books
	resources :autors
	resources :searches

	/
	resources :books do
		collection do
    		get 'search'
  		end
	end
	/
end
