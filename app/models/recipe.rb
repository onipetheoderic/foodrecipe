class Recipe < ApplicationRecord

	belongs_to :user #optional: true must be set for rails 5 app to work with it

	has_many :ingredients, dependent: :destroy #this must be there for the delete method to work
	has_many :directions, dependent: :destroy #this must be there for the delete method to work and avoid foriegn key issues

	accepts_nested_attributes_for :ingredients,
								reject_if: proc { |attributes| attributes['name'].blank? }, #reject if blank
								allow_destroy: true

	accepts_nested_attributes_for :directions,
								reject_if: proc { |attributes| attributes['step'].blank? },
								allow_destroy: true

	validates :title, :description, :image, presence: true
	
	has_attached_file :image, styles: { medium: "400x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	# after doing the paperclip configuration run this:  rails g paperclip recipe image
end
