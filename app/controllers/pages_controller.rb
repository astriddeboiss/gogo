
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def gogo
  end

  def choice_trip
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
    @choices = Trip.where(city: city, user: current_user)
  end

  def profile
  end

  def city_find

  end

end

city = Geocoder.search('#{lat}, #{lng}')
