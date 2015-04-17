Rails.application.routes.draw do
  # Typically I would use resources for routes but I would like to demonstrate that I understand routes
  # resources :patients

  get '/'             => 'patients#index'
  get '/patients'     => 'patients#index', :as => :patients
  get '/patients/new' => 'patients#new', :as => :new_patient
  post '/patients'    => 'patients#create'
end
