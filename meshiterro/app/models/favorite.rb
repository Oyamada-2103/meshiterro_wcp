class Favorite < ApplicationRecord
  # ４章で追加。
  belongs_to :user
  belongs_to :post_image
end
