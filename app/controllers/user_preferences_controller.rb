class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end
  def new
  end

  def create
    @userpreference = UserPreference.new(userpreference_params)
    @userpreference.category = Category.find(params[:category_id])
    @userpreference.user = current_user
  end

  private

  def params_user_preferences
    params.require(:user_preferences).permit(:category)
  end
end
