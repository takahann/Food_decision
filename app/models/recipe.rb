class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :image, presence: true

  attachment :image
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one_attached :video
  has_many :recipe_items, :dependent => :destroy
  accepts_nested_attributes_for :recipe_items, allow_destroy: true
  has_many :likes, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  acts_as_taggable
end
