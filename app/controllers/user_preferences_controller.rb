class UserPreferencesController < ApplicationController
  def index
    @user_preferences = UserPreference.all
  end

  def new
    @userpreference = UserPreference.new
  end

  def create
    params[:user_preference][:category_id].each do |params|
      unless params.empty?
        @userpreference = UserPreference.new
        @userpreference.category = Category.find(params)
        @userpreference.user = current_user
        @userpreference.save
      end
    end
    # @userpreference = UserPreference.new(userpreference_params)
    # @userpreference.category = Category.find(params[:category_id])
    # @userpreference.user = current_user
  end

  # private
  # def userpreference_params
  #   params.require(:user_preference).permit(:category_id)
  # end
end
