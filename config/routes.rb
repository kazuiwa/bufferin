Rails.application.routes.draw do
  root to: 'attendances#new'
  resources :attendances, except: [:show]
  get 'list/:yyyymm' => "attendances#list", as: "list"
end
