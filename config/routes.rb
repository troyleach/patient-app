Rails.application.routes.draw do
  # Typically I would use resources for routes but I would like to demonstrate that I understand routes
  # resources :patients
  # resources :cancers

  get '/'                   => 'patients#index'
  get '/patients'           => 'patients#index', :as => :patients
  get '/patients/new'       => 'patients#new', :as => :new_patient
  get '/patients/:id'       => 'patients#show', :as => :patient
  get '/patients/:id/edit'  => 'patients#edit', :as => :edit_patient
  patch 'patients/:id'      => 'patients#update'
  post '/patients'          => 'patients#create'

  namespace :api do
    namespace :v1 do
      get '/cancers' => 'cancers#index'
      get '/cancers/:id' => 'cancers#show', :as => :cancer
      post '/cancers' => 'cancers#create'
    end
  end

end
