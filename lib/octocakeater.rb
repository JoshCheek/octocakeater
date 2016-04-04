class Octocakeater
  attr_reader :server

  def initialize(attributes)
    @server = attributes[:server]
  end

  def status
    hash = server.get '/cake_eater'
    hash['status']
  end
end
