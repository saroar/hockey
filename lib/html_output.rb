# frozen_string_literal: true
class HtmlOutput < AbstractOutput
  def format(game_result)
    "/n<h2> #{game_result} </h2>/n"
  end
end
