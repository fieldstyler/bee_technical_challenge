require 'rails_helper'

describe "user can visit the welcome page" do
  scenario "and see a dropdown menu" do
    visit '/'
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  scenario "and can search for five nearest electric fuel stations within 5 miles of the searched location" do
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

    visit '/'

    expect(page).to have_field(:location)
    select 'Turing', from: :location
    click_on "Find Nearest Station"

    expect(current_path).to eq('/search')

    expect(page).to have_content("Station: Seventeenth Street Plaza")
    expect(page).to have_content("Address: 1225 17th St. Denver, CO 80202")
    expect(page).to have_content("Fuel Type: ELEC")
    expect(page).to have_content("Access Times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end

  scenario "and search results will also display how many total electric fuel stations are within 5 miles" do
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

    visit '/'
    select 'Turing', from: :location
    click_on "Find Nearest Station"

    expect(page).to have_content("Five closest stations: 188")
  end
end
