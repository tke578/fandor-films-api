class Api::V1::FilmsController < ApplicationController
	respond_to :json

	def show
		respond_with Film.find(params[:id])
	end

end