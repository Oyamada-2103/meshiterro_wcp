Rails.application.routes.draw do

  # get 'users/show'
  # ５章で初期生成。下のresourcesと重複するから削除

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  # 上記は初期から記述あり

  # ３章で追加
  # resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # ４章で下記に変更
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do


  resource :favorites, only: [:create, :destroy]
  # ４章で追加
  # resourcesと単数にすると、そのコントローラのidがリクエストに含まれなくなります。
  # 今回、いいねの詳細ページは作成しません。
  # favoritesのshowページが不要で、idの受け渡しも必要ないので、resourceとなっています。

  resources :post_comments, only: [:create, :destroy]
  end

  # ５章で追加
  resources :users, only: [:show, :edit, :update]

end
