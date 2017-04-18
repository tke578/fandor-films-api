class CreateFilmRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :film_ratings do |t|
    	t.integer :film_id
    	t.float :rating
    end
  end
end
