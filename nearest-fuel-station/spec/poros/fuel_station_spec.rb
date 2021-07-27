require 'rails_helper'

describe FuelStation do
  it 'can create a FuelStation object and has readable attributes' do
    station_hash = {
     :access_days_time=>"MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified",
     :fuel_type_code=>"ELEC",
     :station_name=>"Seventeenth Street Plaza",
     :city=>"Denver",
     :state=>"CO",
     :street_address=>"1225 17th St.",
     :zip=>"80202"
      }

    station = FuelStation.new(station_hash)

    expect(station).to be_a(FuelStation)
    expect(station.name).to eq("Seventeenth Street Plaza")
    expect(station.address).to eq("1225 17th St. Denver, CO 80202")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
  end
end
