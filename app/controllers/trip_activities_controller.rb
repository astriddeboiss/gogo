class TripActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @trip_activities = TripActivity.where.not(latitude: nil, longitude: nil)

    @markers = @trip_activities.map do |trip_activity|
      {
        lat: trip_activity.latitude,
        lng: trip_activity.longitude
        # infoWindow: { content: render_to_string(partial: "/trip_activities/map_box", locals: { trip_activity: trip_activity }) }
      }
    end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @trip_activity = TripActivity.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    params[:trip_activity][:activity_id].each do |activity_id|
      next if activity_id == ''
      activity = Activity.find(activity_id)
      TripActivity.create(trip: @trip, activity: activity) if activity
    end
    redirect_to trip_trip_activities_path
  end

  private

  def params_trip_activity
    params.require(:trip_activity).permit(:activity)
  end
end
