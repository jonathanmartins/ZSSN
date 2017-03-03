Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :survivors, except: [:destroy] do
    resources :resources, except: [:destroy, :update]
    get 'report_infected', on: :member
  end

  get '/infected_survivors', to: 'reports#infected_survivors'
  get '/uninfected_survivors', to: 'reports#uninfected_survivors'
  get '/average_resources', to: 'reports#average_resources'
  get '/points_lost', to: 'reports#points_lost'
end
