# frozen_string_literal: true
require 'json'
class JsonOutput < AbstractOutput
  def format(game_result)
    game_result.to_json
  end
end
