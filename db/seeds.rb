json = ActiveSupport::JSON.decode(File.read('db/films.json'))

json['films'].each do |movie|
  Film.create!(
  	title: movie["title"],
  	description: movie["description"],
  	url_slug: movie["url_slug"],
  	year: movie["year"]
  )
  movie["related_film_ids"].each do |id|
  	RelatedFilm.create!(
  		film_id: movie["id"],
  		related_film_id: id
  	)
  end
end