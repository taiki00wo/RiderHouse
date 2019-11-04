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
      rating_average = rating_sum / riderhouse.posts.count.to_f
      return "評価：#{BigDecimal(rating_average.to_s).floor(1).to_f}/5.0"
    end
  end
end
