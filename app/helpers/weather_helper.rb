module WeatherHelper

    def calculate_elapsed_time_since_last_weather_update(locale_current_epoch_time, last_update_epoch_time)
        return "N/A" if last_update_epoch_time.nil?
        elapsed_seconds = locale_current_epoch_time - last_update_epoch_time

        elapsed_minutes = (elapsed_seconds / 60).to_i

        elapsed_hours = (elapsed_minutes / 60).to_i

        elapsed_days = (elapsed_hours / 24).to_i

        if elapsed_days > 0
            "#{elapsed_days} day#{'s' if elapsed_days > 1} ago"
        elsif elapsed_hours > 0
            "#{elapsed_hours} hour#{'s' if elapsed_hours > 1 && elapsed_hours < 24} ago"
        elsif elapsed_minutes > 0
            "#{elapsed_minutes} minute#{'s' if elapsed_minutes > 1 && elapsed_minutes < 60} ago"
        else
            "Just now - less than a minute ago"
        end
    end

    def display_forecast_duration_text(forecast_days)
        display_string = "Forecast for the next "
        forecast_days == 1 ? display_string += "day" : display_string += "#{forecast_days} days"

        display_string
    end
end
