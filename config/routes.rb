Rails.application.routes.draw do
  resources :lights, only: [:index] do
    put 'update', on: :collection
  end
end
