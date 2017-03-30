# frozen_string_literal: true
class AbstractOutput
  def format(_game_result)
    raise NotImplementedError
  end
end
