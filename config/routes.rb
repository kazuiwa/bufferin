Rails.application.routes.draw do
  root to: 'attendances#new'
  resources :attendances, except: [:show]
  get 'attendances/list/:yyyymm' => "attendances#list"
end
