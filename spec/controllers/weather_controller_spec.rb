require 'rails_helper'

RSpec.describe WeatherController, type: :controller do
    describe "GET /" do
        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end

    end

    describe "GET /weather" do
        it "returns http success" do
            get :show, params: { q: 'New York', days: 3, aqi: 'no' }
            expect(response.status).to eq 200
        end

    end
end
