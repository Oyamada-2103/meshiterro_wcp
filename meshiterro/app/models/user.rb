class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# ここまで初期生成

# 3章で追加 has_manyの後には1:Nの関係になるモデル名を複数形で
has_many :post_images, dependent: :destroy

end
