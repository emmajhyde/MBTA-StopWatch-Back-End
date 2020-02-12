require 'rails_helper'

RSpec.describe MBTAService do
  # let! means save as soon as you create - this sometimes prevents objects from getting IDs
  # make sure to always save :3
  # it didnt work!
  # ah, i had to create! instead of let! because it has to get saved to DB not to testing framework
  let(:station) { Station.create!(name: 'Cheese Town Centre', mbta_id: 'place-jfk') }
  let(:user_params) do
    {
        email: 'alice@example.com',
        password: 'foobarbaz',
        password_confirmation: 'foobarbaz'
    }
  end
  let(:user) { User.create!(user_params) }
  let(:favorite) do
    Favorite.create!(
        station_id: station.id,
        user_id: user.id,
        description: 'Napsack Farts & The China Girls'
  ) end
  let(:response_from_mbta) do
      double('response', status: 202, body: '{"data":[{"attributes":{"arrival_time":"2020-02-10T23:39:45-05:00","departure_time":"2020-02-10T23:40:34-05:00","direction_id":0,"schedule_relationship":null,"status":null,"stop_sequence":130},"id":"prediction-43207011-70085-130","relationships":{"route":{"data":{"id":"Red","type":"route"}},"stop":{"data":{"id":"70085","type":"stop"}},"trip":{"data":{"id":"43207011","type":"trip"}},"vehicle":{"data":{"id":"R-5462DE37","type":"vehicle"}}},"type":"prediction"},{"attributes":{"arrival_time":"2020-02-10T23:40:15-05:00","departure_time":"2020-02-10T23:41:02-05:00","direction_id":1,"schedule_relationship":null,"status":null,"stop_sequence":90},"id":"prediction-43207002-70086-90","relationships":{"route":{"data":{"id":"Red","type":"route"}},"stop":{"data":{"id":"70086","type":"stop"}},"trip":{"data":{"id":"43207002","type":"trip"}},"vehicle":{"data":{"id":"R-5462DFD2","type":"vehicle"}}},"type":"prediction"}],"jsonapi":{"version":"1.0"},"links":{"first":"https://api-v3.mbta.com/predictions?filter[stop]=place-jfk&page[limit]=2&page[offset]=0&sort=departure_time","last":"https://api-v3.mbta.com/predictions?filter[stop]=place-jfk&page[limit]=2&page[offset]=24&sort=departure_time","next":"https://api-v3.mbta.com/predictions?filter[stop]=place-jfk&page[limit]=2&page[offset]=2&sort=departure_time"}}')
  end

  describe "GET /predictions" do
    it "sure does do it" do
      allow(HTTP).to receive(:get).and_return(response_from_mbta)
      predictions = MBTAService.get_predictions(favorite.id)
      expect(predictions[0][:description]).to eq 'Napsack Farts & The China Girls'
    end
  end
end