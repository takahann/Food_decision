class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :food_stuff, presence: true
  validates :procedure, presence: true, length: { maximum: 300 }
  validates :image, presence: true

  attachment :image
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :video

  acts_as_taggable
end
