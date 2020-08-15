class Recipe < ApplicationRecord
	attachment :image
	belongs_to :user
	has_many :reviews, dependent: :destroy

	acts_as_taggable
end
