class FuelStation
  attr_reader :name, :address, :fuel_type, :access_times
  def initialize(json)
    @name = json[:station_name]
    @address = "#{json[:street_address]} #{json[:city]}, #{json[:state]} #{json[:zip]}"
    @fuel_type = json[:fuel_type_code]
    @access_times = json[:access_days_time]
  end
end
