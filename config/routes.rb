Rails.application.routes.draw do
  root to: 'attendances#index'
  resources :attendances do
    collection { get "regist" }
  end
end
