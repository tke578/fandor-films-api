class Api::V1::FilmRatingsController < ApplicationController
	before_action :get_film
	respond_to :json

	def index
		respond_with @film.film_ratings
	end

	def create
		film_rating = @film.film_ratings.new(film_rating_params)
		if film_rating.save
			@film.update_rating if @film.film_ratings.size > 0
      render json: api_film_url(@film), status: 201, location: [:api, @film]
    else
      render json: { errors: film_rating.errors }, status: 422
    end
	end

	def show
    respond_with FilmRating.find(params[:id])
  end

  def get_film
		@film = Film.find(params[:film_id])
	end

	private

    def film_rating_params
      params.require(:film_rating).permit(:rating)
    end
end