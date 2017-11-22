class PlanesController < ApplicationController

	def show 
		@plane = Plane.find(params[:id])
		@airport = Airport.find(@plane.airport_id)
		@passengers = @plane.passengers.paginate(:page => params[:page], :per_page => 2)
		@passenger = Passenger.new
	end

	def create
		@airport = Airport.find(params[:airport_id])
		@airport.planes.create(plane_params)
		redirect_to airport_path(@airport)
	end

	def edit
		@plane = Plane.find(params[:id])
		@airport = Airport.find(@plane.airport_id)
	end	

	def update
		@plane = Plane.find(params[:id])
		@airport = Airport.find(@plane.airport_id)
		@airport.planes.update(plane_params)
		redirect_to airport_path(@airport)	
	end

	def destroy
		@plane = Plane.find(params[:id]).destroy
		@airport = Airport.find(@plane.airport_id)
		redirect_to airport_path(@airport)	
	end

	private
	  def plane_params
	    params.require(:plane).permit(:name)
	end	

end