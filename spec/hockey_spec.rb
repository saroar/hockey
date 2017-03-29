require 'hockey'
require 'json'
require 'builder'

describe Hockey do
  let(:subject) { Hockey.new(2, 2, 'json') }

  describe '#initialize' do
    describe 'with' do
      it 'arguments' do
        expect(subject.instance_variable_get(:@team1_score)).to eq(2)
        expect(subject.instance_variable_get(:@team2_score)).to eq(2)
        expect(subject.instance_variable_get(:@filename)).to eq('json')
      end

      it 'without arguments with raising error' do
        expect { Hockey.new }.to raise_error
      end
    end
  end

  describe 'valid_score?' do
    describe 'should have valid_score?' do
      let(:valid) { subject.valid_score?(2) }

      describe 'with valid agument ' do
        it 'true' do
          expect(valid).to be_truthy
        end

        describe 'false' do
          let(:valid) { subject.valid_score?('2') }
          it { expect(valid).to be_falsey }
        end
      end

      describe 'without valid argument' do
        let(:valid) { subject.valid_score? }

        it 'raise error' do
          expect { valid }.to raise_error
        end
      end
    end
  end

  describe '#format' do
    let(:file) { subject.format('json') }
    let(:result) { { draw: 'Ничья' } }
    let(:json) { result.to_json }

    it 'draw' do
      expect(subject.format).to eq(json)
    end

    describe 'html not valid score' do
      let(:subject) { Hockey.new(2, "2", 'html') }
      let(:result) { { draw: 'Ничья' } }

      it 'should' do
        expect(subject.format).to be_falsey
      end
    end

    describe 'Team 1' do
      let(:subject) { Hockey.new(3, 2, 'json') }
      let(:result)  { { team1_score: 'Победила первая комадна' } }

      it 'win' do
        expect(subject.format).to eq(json)
      end
    end

    describe 'Team2 win' do
      let(:subject) { Hockey.new(2, 3, 'json') }
      let(:result)  { { team2_score: 'Победила вторая комадна' } }
      it 'Team2' do
        expect(subject.format).to eq(json)
      end
    end

    describe 'html' do
      let(:subject) { Hockey.new(2, 2, 'html') }
      let(:result) { { draw: 'Ничья' } }
      let(:html) { "<ul>\n  <li><strong>draw:</strong> <span>Ничья</span></li>\n</ul>\n" }

      it 'should' do
        expect(subject.format).to eq(html)
      end
    end
  end

end
