class Riderhouse < ApplicationRecord
  validates :name, presence: true

  mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
end
