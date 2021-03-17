class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# ここまで初期生成

# 3章で追加 has_manyの後には1:Nの関係になるモデル名を複数形で
has_many :post_images, dependent: :destroy

# 4章で追加。コメントモデルとの紐付け
has_many :post_comments, dependent: :destroy
# dependent: :destroyは、has_manyで使えるオプションで
# 1:Nの関係において、「1」のデータが削除された場合
# 関連する「N」のデータも削除される設定です。

# ４章でいいね機能
has_many :favorites, dependent: :destroy

# 5章で追加。プロフィール画像の設定機能を作成
# refileを使って画像投稿ができるようにする
attachment :profile_image

end
