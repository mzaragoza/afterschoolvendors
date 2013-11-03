Afterschoolvendors::Application.routes.draw do
  devise_for :admins, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                      registrations: 'admins/registrations',
                                      :sessions => "admins/sessions",
                                      :passwords => 'admins/passwords',
                                      :confirmations => 'admins/confirmations'
  }
  authenticate :admin do
    namespace :admins do
      resources :ui
      resources :admins
      resources :categories
      resources :profile, :only => [:edit, :update]
      get '/dashboard' => 'dashboards#index', as: :dashboard
      get '/' => 'dashboards#index'
    end
  end

  # You can have the root of your site routed with "root"
  get 'ping' => 'pages#ping', as: :ping
  match 'about_us' => 'pages#about_us', as: :about_us, via: :all
  match 'list_with_us' => 'pages#list_with_us', as: :list_with_us, via: :all
  match 'contact_us' => 'pages#contact_us', as: :contact_us, via: :all
  match 'faq' => 'pages#faq', as: :faq, via: :all
  root 'pages#index'
end
