class AddAverageRatingToFilm < ActiveRecord::Migration[5.0]
  def change
  	add_column :films, :average_rating, :float
  	add_column :film_ratings, :created_at, :datetime
    add_column :film_ratings, :updated_at, :datetime
  end
end
