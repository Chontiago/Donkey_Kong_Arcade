require 'app/helper_functions.rb'

class LoseScreen
  attr_accessor :current_game_state
  def initialize (score)
    @score = score
    @current_game_state ||= 'lose'
  end

  def screen
    screen_info_text
    state_changes
  end

  def screen_info_text
    #relevant_info = [@score.to_s, 'GAME OVER']
    return HelperFunctions.draw_text([x: HALF_SCREEN_WIDTH, y: HALF_SCREEN_HEIGHT,  size_enum: 4, text: 'GAME OVER'])
  end

  def state_changes
    restart_game
  end

  def restart_game
    restart_game = lambda {@current_game_state = 'gameplay'}
    
    HelperFunctions.key_pressed_output(:key_down, :enter, restart_game )
  end
end