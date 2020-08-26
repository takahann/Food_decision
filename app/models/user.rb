class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20, minimum: 2 }
  validates :introduction, length: { maximum: 100 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  attachment :profile_image
end
