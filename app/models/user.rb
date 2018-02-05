class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                    
  before_save { email.downcase! }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  #validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  
  #アソシエーション
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
  
  mount_uploader :image, ImageUploader
end
