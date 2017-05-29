Rails.application.routes.draw do
  resources :doctors
  resources :patients
  resources :appointments, only: [:new, :create]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'appointments#new'

end
