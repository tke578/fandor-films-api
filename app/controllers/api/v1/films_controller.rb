class Api::V1::FilmsController < ApplicationController
	respond_to :json

	def show
		respond_with Film.find(params[:id])
	end

	def index
		# respond_with Film.search(params)
		films = Film.search(params).page(params[:page]).per(params[:per_page])
    render json: films, meta: { pagination:
                                   { per_page: params[:per_page],
                                     total_pages: films.total_pages,
                                     total_objects: films.total_count } }
	end

end