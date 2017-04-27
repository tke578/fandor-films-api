class Film < ApplicationRecord
	has_many :related_films
	has_many :film_ratings

	scope :filter_by_title, lambda { |title| where("title LIKE ?", "%#{title}%" ) }
  scope :filter_by_description, lambda { |description| where("description LIKE ?", "%#{description}%" )}
  scope :filter_by_url_slug, lambda { |url_slug| where("url_slug LIKE ?", "%#{url_slug}%" )}
  scope :filter_by_year, ->(year) { where("year = ?", year)}
  scope :filter_by_related_film, lambda { |related_film| joins(:related_films).where("related_films.related_film_id = #{related_film}")}
  scope :filter_by_average_rating, lambda { |average_rating| where("average_rating = ?",average_rating)}

	def self.search(params = {})
		films = params[:film_ids].present? ? Film.where(id: params[:film_ids]) : Film.all

		films = films.filter_by_title(params[:title]) if params[:title]
		films = films.filter_by_description(params[:description]) if params[:description]
		films = films.filter_by_url_slug(params[:url_slug]) if params[:url_slug]
		films = films.filter_by_year(params[:year]) if params[:year]
		films = films.filter_by_related_film(params[:related_film]) if params[:related_film]
		films = films.filter_by_average_rating(params[:average_rating]) if params[:average_rating]

		films
	end

	def update_rating
		all_film_ratings = film_ratings.pluck(:rating)
		sum_ratings = all_film_ratings.inject(0, :+)
		new_updated_rating = (sum_ratings/film_ratings.size).round(2)
		update(average_rating: new_updated_rating)
	end

end