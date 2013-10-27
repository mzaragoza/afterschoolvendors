Afterschoolvendors::Application.routes.draw do
  # You can have the root of your site routed with "root"
  get 'ping' => 'pages#ping', as: :ping
  match 'about_us' => 'pages#about_us', as: :about_us, via: :all
  match 'list_with_us' => 'pages#list_with_us', as: :list_with_us, via: :all
  match 'contact_us' => 'pages#contact_us', as: :contact_us, via: :all
  match 'faq' => 'pages#faq', as: :faq, via: :all
  root 'pages#index'
end
