require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def authorize_landing(plane)
    raise "Airport temporarly closed due to bad weather" unless check_weather
    @planes << plane
  end

  def authorize_take_off(plane)
    raise 'No planes currently available' if empty?
    raise "Airport temporarly closed due to bad weather" unless check_weather
    @planes.delete(plane)
  end

  def check_weather
    @weather.clear?
  end

  private

  def empty?
    @planes.empty?
  end

end
