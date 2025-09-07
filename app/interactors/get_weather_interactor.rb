class GetWeatherInteractor
    attr_reader :api_path, :weather_data
    # Interactor for getting weather data from a remote API,
    # and abstracting some of the business logic out of the controller
   
    def initialize(api_path, params=nil)
        @params = params
        @api_path = api_path
        if @api_path.blank?
            raise NoMethodError, "API path is required"
        end

    end

    # this calls my API connection/request class/service,
    def run
        @weather_data = Rails.cache.fetch(@params[:q], expires_in: 30.minutes) do
                            Remote::ApiConnect::Request.get( @api_path, @params )
                        end
        persist!

        [@forecast, @current, @location, @errors ]
        
    end

    def success?
        @success
    end

    # this handles some of the data processing/business logic
    # could be extended to save to a local DB, etc.
    def persist!

        @success = @weather_data.present? && @weather_data['error'].blank?
        if @success
            @forecast = @weather_data['forecast']
            @current = @weather_data['current']
            @location = @weather_data['location']
            @errors = nil
        else
            @forecast = nil
            @current = nil
            @location = nil
            @errors = @weather_data['error'] 
        end
    end


end