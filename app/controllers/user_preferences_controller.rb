class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @user_preference = UserPreference.new(category: Category.find(params[:cat].to_i), trip: @trip)
    @user_preference.user = current_user
    @user_preference.save
    redirect_to select_preferences_trip_path(@trip)
  end
end
