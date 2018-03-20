class TripsController < ApplicationController
  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save!
      redirect_to new_user_preference_path
    else
      redirect_to root_path
    end
  end

  private

  def trip_params
   params.require(:trip).permit(:city_id)
  end

end
