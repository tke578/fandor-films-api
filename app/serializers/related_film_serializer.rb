class RelatedFilmSerializer < ActiveModel::Serializer
  attributes  :related_film_id
  belongs_to :film
end
