class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end

  def new
    @user_preference = UserPreference.new
  end

  def create
    params[:user_preference][:category_id].each do |params|
      unless params.empty?
        @user_preference = UserPreference.new
        @user_preference.category = Category.find(params)
        @user_preference.user = current_user
        @user_preference.save
      end
    end
     redirect_to root_path
    # @userpreference = UserPreference.new(userpreference_params)
    # @userpreference.category = Category.find(params[:category_id])
    # @userpreference.user = current_user
  end

  def edit
    @user_preference = UserPreference.find(params[:id])
  end

  def update
    @user_preference = UserPreference.find(params[:id])
    @user_preference.update(user_preferences_params)
  end

  private

  def user_preferences_params
    params.require(:user_preference).permit(:category_id)
  end
end
