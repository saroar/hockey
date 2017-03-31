# frozen_string_literal: true
require_relative 'abstract_output'
require_relative 'text_output'
require_relative 'json_output'
require_relative 'html_output'
require_relative 'team'
require_relative 'game_result'

require 'rubygems'
require 'bundler/setup'

class Hockey
  attr_reader :team1, :team2

  def initialize(team1, team2, format_parameter = :text)
    @team1 = team1
    @team2 = team2
    @printer = build_formatter(format_parameter)
  end

  # @return [String]
  def print_result
    game_result = GameResult.new(who_win?(team1, team2)).to_s
    @printer.format(game_result)
  end

  private

  # @param [Team] team1
  # @param [Team] team2
  def who_win?(team1, team2)
    if team1.score > team2.score
      "#{team1.name} win"
    elsif team1.score < team2.score
      "#{team2.name} win"
    else
      'Game draw both team done good job'
    end
  end

  # @param [Symbol] format_parameter
  # @return [AbstractOutput]
  def build_formatter(format_parameter)
    case format_parameter
    when :json
      JsonOutput.new
    when :html
      HtmlOutput.new
    else
      TextOutput.new
    end
  end
end
