class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end

  def create
    @user_preferences = UserPreference.new(params_user_preferences)
    @user_preferences.user = current_user
    @user_preferences.save

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_user_preferences
    params.require(:user_preferences).permit(:category)
  end
end
