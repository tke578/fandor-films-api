class FilmSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url_slug, :year, :average_rating
  has_many :related_films

  def average_rating
  	object.average_rating.nil? ? "Be the first to rate this film!" : object.average_rating
  end
end
