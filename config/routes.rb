Rails.application.routes.draw do
  resources :short_urls, path: '/', only: %i[index show create]
  root to: 'short_urls#index'

  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_server_error"

  match '*path' => redirect('/'), via: :get
end
