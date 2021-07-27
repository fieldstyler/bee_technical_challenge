require 'rails_helper'

RSpec.describe FuelService do
  it 'returns fuel stations within five miles' do
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
    stations = FuelService.get_fuel_stations(location)

    expect(stations).to be_a(Hash)
    expect(stations[:fuel_stations]).to be_an(Array)

    station_data = stations[:fuel_stations].first

    expect(station_data).to have_key(:station_name)
    expect(station_data[:station_name]).to be_a(String)

    expect(station_data).to have_key(:street_address)
    expect(station_data[:street_address]).to be_a(String)

    expect(station_data).to have_key(:city)
    expect(station_data[:city]).to be_a(String)

    expect(station_data).to have_key(:state)
    expect(station_data[:state]).to be_a(String)

    expect(station_data).to have_key(:zip)
    expect(station_data[:zip]).to be_a(String)

    expect(station_data).to have_key(:fuel_type_code)
    expect(station_data[:fuel_type_code]).to be_a(String)

    expect(station_data).to have_key(:access_days_time)
    expect(station_data[:access_days_time]).to be_a(String)
  end
end
