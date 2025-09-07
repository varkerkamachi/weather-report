require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WeatherHelper. For example:
#
# describe WeatherHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe WeatherHelper, type: :helper do
  describe "#calculate_elapsed_time_since_last_weather_update" do
    it "returns 'N/A' if last_update_epoch_time is nil" do
      expect(helper.calculate_elapsed_time_since_last_weather_update(1000, nil)).to eq("N/A")
    end
    it "returns 'Just now - less than a minute ago' if less than a minute has passed" do
      expect(helper.calculate_elapsed_time_since_last_weather_update(1000, 999)).to eq("Just now - less than a minute ago")
    end
    it "returns minutes ago if less than an hour has passed" do
      expect(helper.calculate_elapsed_time_since_last_weather_update(1000, 940)).to eq("1 minute ago")
      expect(helper.calculate_elapsed_time_since_last_weather_update(1000, 880)).to eq("2 minutes ago")
      expect(helper.calculate_elapsed_time_since_last_weather_update(1000, 700)).to eq("5 minutes ago")
    end
    it "returns hours ago if less than a day has passed" do
      expect(helper.calculate_elapsed_time_since_last_weather_update(4000, 400)).to eq("1 hour ago")
      expect(helper.calculate_elapsed_time_since_last_weather_update(8000, 400)).to eq("2 hours ago")
      expect(helper.calculate_elapsed_time_since_last_weather_update(20000, 2000)).to eq("5 hours ago")
    end
    it "returns days ago if more than a day has passed" do
      expect(helper.calculate_elapsed_time_since_last_weather_update(174400, 1000)).to eq("2 days ago")
      expect(helper.calculate_elapsed_time_since_last_weather_update(359200, 100000)).to eq("3 days ago")
      expect(helper.calculate_elapsed_time_since_last_weather_update(445800, 95000)).to eq("4 days ago")
    end
  end
end
