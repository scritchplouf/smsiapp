Rails.application.routes.draw do
  resources :secondary_assets do
    resources :primary_assets
  end
  
  resources :primary_assets do
    collection do
      delete 'destroy_multiple'
    end
  end

  root to: 'visitors#index'

end
