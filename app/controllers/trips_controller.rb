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
  def show

    @trip = Trip.find(params[:id])

    # authorize @trip
    @activities = @trip.activities.where.not(latitude: nil, longitude: nil)
    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
        # infoWindow: { content: render_to_string(partial: "/trip_activities/map_box", locals: { trip_activity: trip_activity }) }
      }
    end
  end
  private

  def trip_params
   params.require(:trip).permit(:city_id)
  end


end
