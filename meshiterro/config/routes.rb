Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  # 上記は初期から記述あり

  # ３章で追加
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

end
