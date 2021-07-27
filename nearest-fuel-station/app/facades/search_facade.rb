class SearchFacade
  def self.find_nearest_five_fuel_stations(search_term)
    json = FuelService.get_fuel_stations(search_term)
    total_stations = json[:total_results]
    fuel_stations = []
    json[:fuel_stations].first(5).each do |station|
      fuel_stations << FuelStation.new(station)
    end
    [fuel_stations, total_stations]
  end
end
