class Riderhouse < ApplicationRecord
  validates :name, presence: true

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
