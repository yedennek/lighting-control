Rails.application.routes.draw do
  resources :lights, only: [:index] do
    put 'update', on: :collection
  end

  get 'config', to: 'configuration#index', as: :config_path 
end
