# frozen_string_literal: true
require 'hockey'
require 'json'
require 'builder'
require 'pry'

describe Hockey do
  let(:team1) { Team.new('Team1', 2) }
  let(:team2) { Team.new('Team2', 2) }
  let(:subject) { Hockey.new(team1, team2, :json) }

  describe '#initialize' do
    describe 'with' do
      it 'arguments' do
        expect(subject.instance_variable_get(:@team1)).to eq(team1)
        expect(subject.instance_variable_get(:@team2)).to eq(team2)
        expect(subject.instance_variable_get(:@formatter)).to eq('"Game draw both team done good job"')
      end

      it 'without arguments with raising error' do
        expect { Hockey.new }.to raise_error
      end
    end
  end

  describe '#initialize' do
    let(:team1) { Team.new('Team1', '2') }
    let(:team2) { Team.new('Team2', 2) }
    let(:subject) { Hockey.new(team1, team2, :json) }

    describe 'with' do
      it 'arguments invalid score ' do
        expect { subject.instance_variable_get(:@team1) }.to raise_error
      end
    end
  end

  describe '#print_result' do
    let(:who_win?) { subject.who_win?(team1, team2) }
    let(:game_result) { GameResult.new(who_win?) }

    it 'should print result as text' do
      expect(subject.print_result).to eq('Game draw both team done good job')
    end
  end

  describe '#print_format' do
    it 'should print result as json' do
      expect(subject.print_format).to eq('"Game draw both team done good job"')
    end
  end

  describe '#who_win?' do
    it 'should back team name and draw msg' do
      expect(subject.send(:who_win?, team1, team2)).to eq('Game draw both team done good job')
    end

    describe '' do
      let(:team1) { Team.new('Team1', 3) }
      let(:team2) { Team.new('Team2', 2) }
      let(:subject) { Hockey.new(team1, team2, :json) }

      it 'should back team 1 win msg' do
        expect(subject.send(:who_win?, team1, team2)).to eq('Team1 win')
      end
    end
  end

  describe '#build_formatter' do
    let(:game_result) { GameResult.new(who_win?).to_s }

    it 'should back json format' do
      expect(subject.send(:build_formatter, :json)).to eq('"Game draw both team done good job"')
    end

    it 'should back default format' do
      expect(subject.send(:build_formatter, :text)).to eq('Game draw both team done good job')
    end
  end
end
