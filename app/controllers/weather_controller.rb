class WeatherController < ApplicationController


    def index
        respond_to do |format|
            format.html
        end
    end

    def show
        # @weather = Remote::ApiConnect::Request.get( 'forecast.json', params )
        # :location, :current, :forecast
        @location, @forecast, @current = GetWeatherInteractor.new('forecast.json', params).run
        respond_to do |format|
            format.html { render :show }
            format.json { render json: [@location, @forecast, @current] }
        end

    end

    # def current
    #     location = params[:location]
    #     if location.present?
    #         # Here you would typically call a weather API to get the current weather for the given location.
    #         # For demonstration purposes, we'll just return a placeholder response.
    #         @weather_info = "The current weather at #{location} is Sunny, 75°F."
    #     else
    #         @weather_info = "Please provide a valid location."
    #     end
    #     render :index
    # end 

    private

    def model_params
        params.permit(:q, :days, :aqi, :key)
    end


end
