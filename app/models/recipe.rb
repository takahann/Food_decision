class Recipe < ApplicationRecord
	attachment :image
	belongs_to :user

	acts_as_taggable
end
