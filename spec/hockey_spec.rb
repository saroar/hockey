# frozen_string_literal: true
require 'hockey'
require 'json'
require 'builder'
require 'pry'

describe Hockey do
  let(:team1) { Team.new('Team1', 2) }
  let(:team2) { Team.new('Team2', 2) }
  let(:hockey) { Hockey.new(team1, team2, :json) }

  describe '#print_result' do
    let(:who_win?) { hockey.who_win?(team1, team2) }
    let(:game_result) { GameResult.new(who_win?) }

    it 'should print result as text' do
      expect(hockey.print_result).to eq('"Game draw both team done good job"')
    end
  end

  describe '#who_win?' do
    it 'should back team name and draw msg' do
      expect(hockey.send(:who_win?, team1, team2)).to eq('Game draw both team done good job')
    end

    describe '#who_win?' do
      let(:team1) { Team.new('Team1', 3) }
      let(:team2) { Team.new('Team2', 2) }
      let(:hockey) { Hockey.new(team1, team2, :json) }

      it 'Team1' do
        expect(hockey.send(:who_win?, team1, team2)).to eq('Team1 win')
      end
    end

    describe '#who_win?' do
      let(:team1) { Team.new('Team1', 3) }
      let(:team2) { Team.new('Team2', 4) }
      let(:hockey) { Hockey.new(team1, team2, :html) }

      it 'Team2' do
        expect(hockey.send(:who_win?, team1, team2)).to eq('Team2 win')
      end
    end

    describe '#who_win? ' do
      let(:team1) { Team.new('Team1', 3) }
      let(:team2) { Team.new('Team2', 4) }
      let(:hockey) { Hockey.new(team1, team2) }

      it 'Team2 with default format' do
        expect(hockey.send(:who_win?, team1, team2)).to eq('Team2 win')
      end
    end
  end
end
