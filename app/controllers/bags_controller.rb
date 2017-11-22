class BagsController < ApplicationController

	def show 
		@bag = Bag.find(params[:id])
		@passenger = Passenger.find(@bag.passenger_id)
	end

	def create
		@passenger = Passenger.find(params[:passenger_id])
		@passenger.bags.create(bag_params)
		redirect_to passenger_path(@passenger)
	end

	def edit
		@bag = Bag.find(params[:id])
		@passenger = Passenger.find(@bag.passenger_id)
	end	

	def update
		@bag = Bag.find(params[:id])
		@passenger = Passenger.find(@bag.passenger_id)
		@bag.update(bag_params)
		redirect_to passenger_path(@passenger)	
	end

	def destroy
		@bag = Bag.find(params[:id]).destroy
		@passenger = Passenger.find(@bag.passenger_id)
		redirect_to passenger_path(@passenger)	
	end

	private
	  def bag_params
	    params.require(:bag).permit(:name)
	end	
end
