class Post < ApplicationRecord
  belongs_to :user
  belongs_to :riderhouse

  validates :rating, presence: true
  validates :content, presence: true

  # ライダーハウスのratingの平均
  def rating_average(riderhouse)
    rating_sum = 0
    riderhouse.posts.each do |post|
      rating_sum += post.rating
    end
    if riderhouse.posts.count == 0
      return '評価なし'
    else
      return "評価：#{rating_sum / riderhouse.posts.count.to_f}"
    end
  end
end
