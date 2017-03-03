Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :survivors, except: [:destroy] do
    resources :resources, except: [:destroy, :update]
  end
end
