# lib to handle the API connection/integration
# using faraday gem to handle the calls/connection 
require 'faraday'
require 'json'
require 'uri'

module Remote::ApiConnect
# -- issues with pathing/namespacing to module and ActiveSupport::Concern, will try and resolve later

    class Connection

        def self.api( endpoint=nil, version=nil )
        url = self.set_url( endpoint, version)

        conn = Faraday.new(url: url) do |f|
            f.adapter Faraday.default_adapter
            f.headers['Content-Type'] = 'application/json'
        end

        conn
        end


        def self.default_version
            'v1'
        end

        def self.set_url( endpoint=nil, version=nil )
            @base_url = ENV['KEY_WEATHER_API_BASE_URL'] || KEY_WEATHER_API_BASE_URL  # -- refactor out to util definition
            endpoint = endpoint.blank? ? @base_url.slice(0, @base_url.length-1) : endpoint
            version = version.blank? ? self.default_version : version
            url = [endpoint, version].join('/')
        end
    end

    class Request
        def self.get( path_segment, params={} )
            response = api.get do |req|
                req.url path_segment
                req.params = params
                req.params.merge!({key: ENV['KEY_WEATHER_API_ACCESS_KEY'] || KEY_WEATHER_API_ACCESS_KEY}) # -- refactor out to util definition

            end
            JSON.parse(response.body) if response.body.present?
                rescue JSON::ParserError => e
                    Rails.logger.error "JSON Parse Error: #{e.message}"
                rescue StandardError => e
                    Rails.logger.error "Request Error: #{e.message}"

        end 

        # initialize the API connection request
        def self.api( endpoint=nil, version=nil )
            Connection.api( endpoint, version )
        end

        # -- useful if versioning APIs , can quickly change versions
        def set_version version=nil
            if version.blank?
                version = Connection.default_version
            end
            version
        end


    # -- could add a helper method to efficiently handle errors
    # def errors(response)
    # @response = JSON.parse(response.body)
    # # JsonApiResponse::Errors.new(@response["status"], @response["error_description"]).response
    # end
  end


  # -- would want the API key stored in a vault or cloud key management service
#   def set_api_key
#     @api_key = ENV['KEY_WEATHER_API_ACCESS_KEY'] || KEY_WEATHER_API_ACCESS_KEY
#   end

#   def set_default_url
#     @base_url = ENV['KEY_WEATHER_API_BASE_URL'] || KEY_WEATHER_API_BASE_URL
#   end

end