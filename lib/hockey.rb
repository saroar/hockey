class Hockey
  def initialize(team1_score, team2_score, filename)
    @team1_score = team1_score
    @team2_score = team2_score
    @filename = filename
  end

  def valid_score?(score)
    return true if score.is_a? Integer
  end

  def format
    result = {}

    return false unless valid_score?(@team1_score) && valid_score?(@team2_score)

    if @filename == 'json'
      match_result(result)
      result.to_json
    else
      @filename == 'html'
      match_result(result)

      indent_level = result.fetch(:indent_level) { 0 }

      out = ' ' * indent_level + "<ul>\n"

      result.each do |key, value|
        out += ' ' * (indent_level + 2) + "<li><strong>#{key}:</strong>"
        out += " <span>#{value}</span></li>\n"
      end
      out += ' ' * indent_level + "</ul>\n"
    end
  end

  def match_result(hash)
    if @team1_score > @team2_score
      hash.merge!(team1_score: 'Победила первая комадна')
    elsif @team1_score < @team2_score
      hash.merge!(team2_score: 'Победила вторая комадна')
    else
      hash.merge!(draw: 'Ничья')
    end
  end
end
