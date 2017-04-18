class Film < ApplicationRecord
	has_many :related_films
	has_many :film_ratings
end