class WeatherController < ApplicationController

    def index
        # @location = {my_index_loc: "Idx here, where I am!"}

        respond_to do |format|
            format.html
        end

    end

    def search
        # -- hard-coding these for now, ordinarily they'd be passed in from the form
        params = model_params.merge!({
            aqi: 'yes',
            days: 5
        })
        @forecast, @current, @location, @errors  =  GetWeatherInteractor.new('forecast.json', params).run
        # Rails.logger.info "params: #{params.inspect} ----------------"

        if @errors.present?
            respond_to do |format|
                format.turbo_stream { 
                                    render turbo_stream: turbo_stream.replace(
                                                            "location_errors", 
                                                            partial: "error_messages", 
                                                            locals: { 
                                                                errors: @errors
                                                                } 
                                                                        )  
                                                                                }
            end

        else
            respond_to do |format|
                format.turbo_stream { 
                                    render turbo_stream: turbo_stream.replace(
                                                            "location_info", 
                                                            partial: "location", 
                                                            locals: { 
                                                                location: @location,
                                                                forecast: @forecast,
                                                                current: @current
                                                                } 
                                                                        )  
                                                                                }
            end

        end
    end



    private
    # -- whitelisting params for security/safety
    def model_params
        params.permit(:q, :days, :aqi, :key)
    end


end
