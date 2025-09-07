require 'rails_helper'
RSpec.describe WeatherController, type: :routing do

    describe 'get /' do
        it 'routes to weather#index' do
            expect(get('/')).to route_to(controller: "weather",
                                        action: "index")
        end
    end

    describe 'post /weather/search' do
        it 'routes to weather#search' do
            expect(post('/weather/search')).to route_to(controller: "weather",
                                        action: "search")
        end
    end
end