class SearchController < ApplicationController
  def index
    current_location = params[:location]
    fuel_response = SearchFacade.find_nearest_five_fuel_stations(current_location)
    @fuel_stations = fuel_response[0]
    @fuel_stations_count = fuel_response[1]
  end
end
