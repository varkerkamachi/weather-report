require 'rails_helper'
RSpec.describe GetWeatherInteractor do
    describe "#initialize" do
        it "initializes with api_path and params" do
            interactor = GetWeatherInteractor.new("/current.json", { q: 'New York', days: 3, aqi: 'no' })
            expect(interactor.api_path).to eq("/current.json")
            expect(interactor.instance_variable_get(:@params)).to eq({ q: 'New York', days: 3, aqi: 'no' })
        end
        it "fails without api_path" do
            expect { GetWeatherInteractor.new(nil, { q: 'New York' }) }.to raise_error(NoMethodError)
        end
    end
end