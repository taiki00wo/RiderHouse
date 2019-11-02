class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :riderhouses, dependent: :destroy
  has_many :riderhouses, through: :favorites

  mount_uploader :image, ImageUploader
end
