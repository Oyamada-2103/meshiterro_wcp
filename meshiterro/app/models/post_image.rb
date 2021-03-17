class PostImage < ApplicationRecord

  # 3章で追加 userモデルとの関係性
  belongs_to :user

  # 3章で追加 画像アップ用のメソッド（attachment）を追加してフィールド名に（image）を指定
  # refileを使用するうえでのルール
  attachment :image  # ここを追加（_idは含めません）
  
  
  # ４章で追加。コメントモデルと紐付け
  # 複数のコメントモデルを持つ
  has_many :post_comments, dependent: :destroy
  
  # 4章で追加。フェイバリットモデルと紐付け
  has_many :favorites, dependent: :destroy
 
  # ６章で追加。バリデーションの設定
  validates :shop_name, presence: true
  validates :image, presence: true
 
 
  # 4章で追加。フェイバリットモデルと紐付け
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  
end
