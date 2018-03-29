class ActivitiesController < ApplicationController

  def show
    @last_trip_visited = params[:trip]
    @activity = Activity.find(params[:id])
  end
end
