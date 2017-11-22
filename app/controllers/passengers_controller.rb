class PassengersController < ApplicationController
	def show 
		@passenger = Passenger.find(params[:id])
		@plane = Plane.find(@passenger.plane_id)
		@bags = @passenger.bags.paginate(:page => params[:page], :per_page => 2)
		@bag = Bag.new
	end

	def create
		@plane = Plane.find(params[:plane_id])
		@plane.passengers.create(passenger_params)
		redirect_to plane_path(@plane)
	end

	def edit
		@passenger = Passenger.find(params[:id])
		@plane = Plane.find(@passenger.plane_id)
	end	

	def update
		@passenger = Passenger.find(params[:id])
		@plane = Plane.find(@passenger.plane_id)
		@passenger.update(passenger_params)
		redirect_to plane_path(@plane)	
	end

	def destroy
		@passenger = Passenger.find(params[:id]).destroy
		@plane = Plane.find(@passenger.plane_id)
		redirect_to plane_path(@plane)	
	end

	private
	  def passenger_params
	    params.require(:passenger).permit(:name)
	end	
end