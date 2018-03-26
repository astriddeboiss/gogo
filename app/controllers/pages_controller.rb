
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def gogo
  end

  def choice_trip
    require 'rest_client'
    require 'json'
    require 'open-uri'
    url = "https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV["GOOGLE_API_SERVER_KEY"]}"
    response = RestClient.post url, {}
    serialized_response = JSON.parse(response)
    lat = serialized_response.first.last["lat"]
    lng = serialized_response.first.last["lng"]
  end

  def profile
  end

  def city_find

  end

end
