class FuelService

  def self.get_fuel_stations(location)
    response = connection.get('nearest') do |request|
      request.headers['X-Api-Key'] = ENV['FUEL_KEY']
      request.params['location'] = location
      request.params['fuel_type'] = 'ELEC'
      request.params['limit'] = 5
      request.params['format'] = 'json'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new('https://developer.nrel.gov/api/alt-fuel-stations/v1/')
  end
end
