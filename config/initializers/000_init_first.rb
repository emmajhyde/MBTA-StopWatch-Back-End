require 'pry'
require_relative '../../app/services/mbta_service'

# lets make a station
Station.new(
response = MBTAService.get_predictions('place-jfk')



