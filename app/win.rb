require 'app/helper_functions.rb'

class WinScreen
  attr_accessor :current_game_state
  def initialize(score)
    @score = score
    @current_game_state ||= 'win'
  end

  def screen
    screen_text_info
    state_changes
    
  end

  def screen_text_info
    return HelperFunctions.draw_text([x: HALF_SCREEN_WIDTH, y: HALF_SCREEN_HEIGHT,  size_enum: 4, text: 'WIN'])
  end

  def current_screen
  end

  def state_changes
    restart_game
  end

  def restart_game
    restart_game = lambda {@current_game_state = 'gameplay'}
    
    HelperFunctions.key_pressed_output(:key_down, :enter, restart_game )
  end


end