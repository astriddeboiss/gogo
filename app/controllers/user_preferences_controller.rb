class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @category = Category.find(params[:cat].to_i)
    @user_preference = UserPreference.new(category: @category, trip: @trip)
    @user_preference.user = current_user
    @user_preference.save
  end

  def destroy
    @category = Category.find(params[:cat].to_i)
    @user_preference= UserPreference.find(params[:id])
    @trip = @user_preference.trip
    @user_preference.destroy
  end
end
