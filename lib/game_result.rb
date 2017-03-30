# frozen_string_literal: true
class GameResult
  attr_reader :text_result

  # @param [String] game_status
  def initialize(game_status)
    @text_result = game_status.respond_to?(:name) ? game_status.name : game_status
  end

  def to_s
    text_result
  end
end
