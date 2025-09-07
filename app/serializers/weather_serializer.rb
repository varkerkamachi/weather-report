class WeatherSerializer < ActiveModel::Serializer
  attributes :current, :forecast, :location
  
end
