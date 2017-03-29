class Hockey
  attr_reader :team1_score, :team2_score, :filename

  def initialize(team1_score, team2_score, filename)
    @team1_score = team1_score
    @team2_score = team2_score
    @filename = filename
  end

  def valid_score?(score)
    score.is_a? Integer
  end

  def format
    hash = {}

    return false unless valid_score?(team1_score) && valid_score?(team2_score)

    case filename
    when 'json' then convert_json(hash)
    when 'html' then convert_html(hash)
    end
  end

  def match_result(hash)
    if team1_score > team2_score
      hash.merge!(team1_score: 'Победила первая комадна')
    elsif team1_score < team2_score
      hash.merge!(team2_score: 'Победила вторая комадна')
    else
      hash.merge!(draw: 'Ничья')
    end
  end

  def convert_html(hash)
    match_result(hash)

    hash.inject('<ul>') do |result, (key, value)|
      result + "\n <li><strong>#{key}:</strong> <span>#{value}</span></li>\n"
    end + "</ul>\n"
  end

  def convert_json(hash)
    match_result(hash)
    hash.to_json
  end
end

