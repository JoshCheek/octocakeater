class Octocakeater
  attr_reader :server, :name

  def initialize(attributes)
    @server = attributes[:server]
    @name   = attributes[:name]
  end

  def status
    hash = server.get '/cake_eater'
    hash['status']
  end

  def score
    hash = server.get '/cake_eater'
    robot = hash['leaderboard'].find do |robot|
      robot['name'] == name
    end
    robot['score']
  end
end
