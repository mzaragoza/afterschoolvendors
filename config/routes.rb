Afterschoolvendors::Application.routes.draw do
  # You can have the root of your site routed with "root"
  get 'ping' => 'pages#ping', as: :ping
  root 'pages#index'
end
