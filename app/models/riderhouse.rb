class Riderhouse < ApplicationRecord
  validates :name, presence: true
  validates :name, length:  { maximum: 14 }

  mount_uploader :image, ImageUploader

  belongs_to :user, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
