Rails.application.routes.draw do
  root "terminal#index"
  
  post "/execute", to: "terminal#execute"
  
  get "up" => "rails/health#show", as: :rails_health_check
  
end
