require 'octocakeater'

class FakeServer
  def initialize
    @responses = {}
  end

  def on_get(path, body)
    @responses[[:get, path]] = body
  end

  def get(path)
    @responses[[:get, path]]
  end
end


class AcceptanceTest < Minitest::Test
  def test_it_uses_the_api
    server = FakeServer.new
    robot = Octocakeater.new(
      name:   'octocakeater',
      server: server
    )

    # get '/cake_eater'
    server.on_get '/cake_eater', {
      "status" => "in_progress",
      "cake_remaining" => 27,
      "leaderboard" => [
        { "name" => "octocakeater", "score" => 14 },
        { "name" => "team2", "score" => 0 }
      ]
    }
    assert_equal 'in_progress', robot.status
    assert_equal 14,            robot.score

    # get '/cake_eater/robots/octocakeater'
    # put '/cake_eater/robots/octocakeater'
    #   'eat_cake'
    #   'move_north'
    #   'move_east'
    #   'move_south'
    #   'move_west'
  end
end
