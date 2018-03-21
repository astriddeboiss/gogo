class TripsController < ApplicationController
  def show
    @trip = Trip.find(params[:id])
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save!
      if current_user.user_preferences
        redirect_to new_trip_trip_activity_path(@trip)
      else
        redirect_to new_user_preference_path
      end
    else
      redirect_to root_path
    end
  end

  private

  def trip_params
   params.require(:trip).permit(:city_id)
  end

end
