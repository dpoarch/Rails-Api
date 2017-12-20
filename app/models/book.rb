class Book < ApplicationRecord
	has_many :borrows, dependent: :destroy

  	# validations
	validates_presence_of :title, :author, :pages
end
