class JourniesController < ApplicationController

	def index
		@journies = Journey.all
		render json: @journies
	end
	
	def new
		@journey = Journey.new
	end

	def create
		@journey  =Journey.create(journey_params)

		if @journey.save
			redirect_to @journey
		else
			redirect_to 'new'
		end
	end

	def edit
		@journey = Journey.find(params[:id])
		render json: @journey
	end
	
	def update
		@journey = Journey.find(params[:id])

		if @journey.update(journey_params)
			# redirect_to @journey
			render json: @journey
		else
			# render 'edit'
			render json: @journey
		end
	end

	def show
		@journey = Journey.find(params[:id])
		render json: @journey
	end

	def destroy
		@journey = Journey.find(params[:id])
		@journey.destroy

		# redirect_to journies_path
	end


	private
		def journey_params
			params.require(journey).permit(:title, :author, :post_date, :description)
		end
end
