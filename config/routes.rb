Rails.application.routes.draw do
  #resources :users, except: [:new, :edit]

  post 'api_key' => 'api_keys#create'
  delete 'api_key' => 'api_keys#destroy'
end
