Rails.application.routes.draw do

	

  devise_for :admins
	resources :devise
  	devise_for :users, path_name: {sign_in: "login", sign_out: "logout" } 
	root 'books#index'


	resources :autors

	
	resources :books do
		collection do
    		get 'index_admin'
    		post :import
  		end
	end
	
end
