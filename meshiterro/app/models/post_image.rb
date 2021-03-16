class PostImage < ApplicationRecord

  # 3章で追加 userモデルとの関係性
  belongs_to :user

  # 3章で追加 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定
  # refileを使用するうえでのルール
  attachment :image  # ここを追加（_idは含めません）
  
end
