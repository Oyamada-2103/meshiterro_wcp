class PostComment < ApplicationRecord

# ４章で追加
# ユーザーモデルとイメージ（投稿）モデルとの紐付け
belongs_to :user
belongs_to :post_image

end
