# frozen_string_literal: true

require 'http'

class MBTAService
  MBTA_API_V3 = 'https://api-v3.mbta.com'
  MBTA_PREDICTIONS = 'predictions?'
  MBTA_SORT_AND_LIMIT = 'sort=departure_time&page[limit]=2'

  def self.get_predictions(favorite_id)
    favorite = Favorite.find(favorite_id)
    station = Station.find(favorite.station_id)
    response = HTTP.get(resolve_predictions_url(station.mbta_id))
    json = JSON.parse(response.body)
    # whatever the structure is...
    json['data'].map do |prediction|
      # this whole hash is assigned to direction_and_time,
      # regardless of if it is arriving or departing.

      direction_and_time = if prediction['attributes']['arrival_time']
                             {
                               name: station.name,
                               direction: :arrival,
                               time: prediction['attributes']['arrival_time'],
                               description: favorite.description
                             }
                           else
                             {
                               name: station.name,
                               direction: :departure,
                               time: prediction['attributes']['departure_time'],
                               description: favorite.description
                             }
        end
    end
    end

  private

  def self.resolve_predictions_url(mbta_stop_id)
    "#{MBTA_API_V3}/#{MBTA_PREDICTIONS}filter[stop]=#{mbta_stop_id}&#{MBTA_SORT_AND_LIMIT}"
  end
  end
