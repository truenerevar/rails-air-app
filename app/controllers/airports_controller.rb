class AirportsController < ApplicationController
	
	def index 
		# @airports = Airport.all
		@airports = Airport.paginate(:page => params[:page], :per_page => 2)
		@airport = Airport.new
		@airport.avatar = params[:file]
	end

	def show 
		@airport = Airport.find(params[:id])
		@planes = @airport.planes.paginate(:page => params[:page], :per_page => 2)
		@plane = Plane.new
	end

	def create
		Airport.create(airport_params)
		redirect_to airports_path
	end

	def edit
		@airport = Airport.find(params[:id])
	end	

	def update
		@airport = Airport.find(params[:id])
		@airport.update(airport_params)
		redirect_to airport_path
	end

	def destroy
		@airport = Airport.find(params[:id]).destroy
		redirect_to airports_path	
	end

	private
	  def airport_params
	    params.require(:airport).permit(:name, :avatar)
	end	

end