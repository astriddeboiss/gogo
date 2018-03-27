class TripsController < ApplicationController
  def index
    @user = current_user
    @trips = Trip.all.where(user: @user)
  end

  def create
    # City.near([params[:longitude], params[:latitude]], 50)
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
        redirect_to select_preferences_trip_path(@trip)
    else
      redirect_to root_path
    end
  end


  def select_preferences
    @trip = Trip.find(params[:id])
    @categories = Category.all
  end

  def show
    @trip = Trip.find(params[:id])
    # authorize @trip
    @activities = @trip.activities.where.not(latitude: nil, longitude: nil)
    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: { content: render_to_string(partial: "trip_activities/map_box", locals: { activity: activity }) }
      }
    end
  end

  private

  def trip_params
   params.require(:trip).permit(:city_id, :name)
  end

end

