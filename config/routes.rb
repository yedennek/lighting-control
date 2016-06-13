Rails.application.routes.draw do
  resources :lights, only: [:index] do
    put 'update', on: :collection
  end

  get 'config', to: 'configuration#index', as: :config_path 
  post 'config/upload', to: 'configuration#upload', as: :config_upload_path 
end
