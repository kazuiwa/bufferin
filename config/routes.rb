Rails.application.routes.draw do
  root to: 'attendances#new'
  resources :attendances
  #post 'attendances/regist' => 'attendances#regist'
end
