class TripActivitiesController < ApplicationController
  def index
    @trip = Trip.find(params[:trip_id])
    @trip_activities = TripActivity.where(trip_id: @trip)
    @activities = @trip.activities.where.not(latitude: nil, longitude: nil)
    @markers = @activities.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        infoWindow: { content: render_to_string(partial: "trip_activities/map_box", locals: { activity: activity }) }
      }
    end
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @city = @trip.city
    @user = current_user
    @categories = @user.categories
    @activities = Activity.where(city: @city).where(category: @categories)
    @trip_activity = TripActivity.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    params[:trip_activity][:activity_id].each do |activity_id|
      next if activity_id == ''
      activity = Activity.find(activity_id)
      TripActivity.create(trip: @trip, activity: activity) if activity
    end
    redirect_to trip_trip_activities_path
  end

  def visited
    @trip_activity = TripActivity.find(params[:id])
    @trip_activity.mark_as_done = true
    @trip_activity.save
    redirect_to trip_trip_activities_path(@trip_activity.trip)
  end

  def not_visited
    @trip_activity = TripActivity.find(params[:id])
    @trip_activity.mark_as_done = false
    @trip_activity.save
    redirect_to trip_trip_activities_path(@trip_activity.trip)
  end

  def gogo
    # require 'rest_client'
    # url = "https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV["GOOGLE_API_SERVER_KEY"]}"
    # response = RestClient.post url, {}
    # serialized_response = JSON.parse(response)
    # lat = serialized_response.first.last["lat"]
    # lng = serialized_response.first.last["lng"]
    lat = params[:latitude]
    lng = params[:longitude]
    address_components = Geocoder.search("#{lat}, #{lng}").first.data["address_components"]
    city_hash = address_components.detect {|element| element.has_key?("types") && element["types"] == ["locality", "political"]}
    city = City.find_by_name(city_hash["long_name"])

    user = current_user
    @trip = Trip.find_by "starts_at <= ? AND ends_at >= ? AND city_id = ? AND user_id = ?", Time.now, Time.now, city.id, user.id
    @filter = open_activities(@trip)

  end

  def city_find
  end

  private

  def params_trip_activity
    params.require(:trip_activity).permit(:trip, :activity)
  end

  def open_activities(trip)
    visit_min = activity.duration
    opening_hour = activity.opens_at.hour
    opening_min = activity.opens_at.min
    closing_hour = activity.closes_at.hour
    closing_min = activity.closes_at.min
    begining_hour = Time.now.hour
    begining_min = Time.now.min
    ending_min = (begining_min + visit_min%60)%60
    ending_hour = begining_hour + visit_min.div(60) + (begining_min + visit_min%60).div(60)
    # return TripActivity.where "trip_id = ? AND begining_hour > ? ", trip.
    # return TripActivity.where "trip_id = ? AND clothing_hour > Activity.find.opens_at.hour", trip.id
  end
end
# endAND fin_hour < closing_hour || (fin_hour == closing_hour && fin_min > closing_min)
