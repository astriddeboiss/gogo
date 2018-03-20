class TripActivitiesController < ApplicationController
  def new
  end

  def ceate
  end

  def visited
    @trip_activities.trip = current_user.trips.find(params[:trip_id])
    @trip_activity.activity.mark_as_done = true
    @trip_activity.save
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
