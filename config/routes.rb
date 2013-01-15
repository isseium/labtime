Labtime::Application.routes.draw do
  match "/auth/:provider/callback" => "sessions#callback"
  match "/auth/failure" => "sessions#failure"
  match "/logout" => "sessions#destroy", :as => :logout
  root :to => 'top#index'
  match ':controller(/:action(/:id))(.:format)'
  match "work/users"

  post '/in', :to => 'work#in'
  post '/out', :to => 'work#out'
end
