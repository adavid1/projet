class Town < ActiveRecord::Base
  before_validation :geocode
  validates :name, :latitude, :longitude, presence: true
 
  def get_weather
     darksky = ForecastIO.forecast(latitude, longitude, params: { lang: 'fr', units: 'si' }).currently
     if darksky
       return darksky
     end
end
  
  private
  def geocode
    towns = Nominatim.search.city(self.name).limit(1)
    if towns && towns.first
      current_town = towns.first
      self.latitude = current_town.latitude
      self.longitude = current_town.longitude
    end
  end
end