class TripActivitiesController < ApplicationController

  def index
    @trip_activities = TripActivity.all
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @trip_activity = TripActivity.new
  end

  def create
    @trip_activity = TripActivity.new(params_trip_activity)
    @trip_activity.trip = Trip.find(params[:id])
    @trip_activity.save
    redirect_to trip_trip_activities_path
  end

  private

  def params_trip_activity
    params.require(:trip_activity).permit(:activity)
  end
end
