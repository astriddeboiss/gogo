class UserPreferencesController < ApplicationController
  def new
  end

  def create
    @userpreference = UserPreference.new(userpreference_params)
    @userpreference.category = Category.find(params[:category_id])
    @userpreference.user = current_user
  end


  # def update
  #   @userpreference = UserPreference.find(params[:id]
  #   @booking.update(booking_params)
  #   redirect_to dashboard_path
  # end

  private

  def userpreference_params
    params.require(:user_preference).permit(:start_at, :status)
  end

end




