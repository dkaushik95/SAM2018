Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  post 'pcc/assign_paper'
  get 'pcc/index'
  get 'pcc/show_paper'
  post 'pcm_controller/request_paper'
  delete 'pcm_controller/delete_request'
  get 'pcm_controller/index'
  #root "pcm_controller#index"

  get 'pages/index'
  resources :papers
  root "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
