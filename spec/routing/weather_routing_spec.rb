require 'rails_helper'
RSpec.describe WeatherController, type: :routing do

    describe 'get /' do
        it 'routes to weather#index' do
            expect(get('/')).to route_to(controller: "weather",
                                        action: "index")
        end
    end

    describe 'get /weather' do
        it 'routes to weather#show' do
            expect(get('/weather')).to route_to(controller: "weather",
                                        action: "show")
        end
    end
end