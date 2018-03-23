class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end
end
