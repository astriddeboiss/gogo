class TripActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @trip_activities = TripActivity.all
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

  def visited
    # @trip_activity = TripActivity.new()
    @trip_activity.trip = current_user.trips.find(params[:trip_id])

    @trip_activity = (TripActivityInstance).activity.update_attribute(:mark_as_done, true)
    @trip_activity.save

    Activity.find(31).update_attribute(:mark_as_done, true)

    # redirect_to current_user
  end

  def not_visited
    @trip_activity.trip = current_user.trips.find(params[:trip_id])
    @trip_activity.activity.mark_as_done = false
    @trip_activity.save

    # @trip_activity = current_user.trip_activities.find(params[:trip_id])
    # @trip_activity.activity.mark_as_done = false
    # @trip_activity.save
    # redirect_to current_user
  end
end
