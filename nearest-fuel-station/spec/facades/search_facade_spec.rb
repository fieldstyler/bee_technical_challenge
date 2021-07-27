require 'rails_helper'

RSpec.describe SearchFacade do
    it 'returns the five closest fuel stations within five miles and total number of stations with five miles' do
    json_response = File.open("./fixtures/fuel_stations.json")
    stub_request(:get, "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest?format=json&fuel_type=ELEC&limit=5&location=1331%2017th%20St%20LL100,%20Denver,%20CO%2080202").
    with(
      headers: {
        'Accept'=>'*/*',
     	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     	  'User-Agent'=>'Faraday v1.5.1',
     	  'X-Api-Key'=> ENV['FUEL_KEY']
      }
    ).
    to_return(status: 200, body: json_response)
    location = "1331 17th St LL100, Denver, CO 80202"
    stations_array = SearchFacade.find_nearest_five_fuel_stations(location)

    fuel_station_poros = stations_array[0]
    total_stations = stations_array[1]

    expect(fuel_station_poros).to be_an(Array)
    fuel_station_poros.each do |poro|
      expect(poro).to be_a(FuelStation)
    end

    expect(total_stations).to be_an(Integer)
  end
end
