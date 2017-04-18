class FilmSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url_slug, :year, :related_film_ids, :average_rating

  def related_film_ids
  	return object.related_films.pluck(:related_film_id) if object.related_films
  end

  def average_rating
  	if object.film_ratings.size > 0
  		film_ratings = object.film_ratings.pluck(:rating)
  		sum_ratings = film_ratings.inject(0, :+)
  		return (sum_ratings/film_ratings.size).round(2)
  	else 
  		"Rate this film!"
  	end
  end
end
