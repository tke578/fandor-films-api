class FilmRating < ApplicationRecord
	belongs_to :film

	validates_numericality_of :rating, less_than_or_equal_to: 5, greater_than: 0, presence: true
end