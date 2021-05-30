Rails.application.routes.draw do
  resources :short_urls, path: '/', only: %i[index show create]
  root to: 'short_urls#index'

  match '*path' => redirect('/'), via: :get
end
