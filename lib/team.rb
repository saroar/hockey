# frozen_string_literal: true
class Team
  attr_reader :name, :score

  # @param [String] name
  # @param [Integer] score
  def initialize(name, score)
    @name = name
    @score = score
  end
end
