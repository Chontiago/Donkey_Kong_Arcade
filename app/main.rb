$gtk.reset
BARREL_JUMPED_POINTS = 200
FLOOR_HEIGHT = 20
FULL_SCREEN_WIDTH = 1280
FULL_SCREEN_HEIGHT = 720
GRAVITY = 5
HALF_SCREEN_WIDTH = FULL_SCREEN_WIDTH / 2
HALF_SCREEN_HEIGHT = FULL_SCREEN_HEIGHT / 2
JUMPMAN_WIDTH = 50
JUMPMAN_HEIGHT = 50
LEFT_BORDER = 0
RIGHT_BORDER = FULL_SCREEN_WIDTH

#Mandar el mensaje de game_over de gameplay a game_over de main
#Intentar pasar de gameplay a barrel todas las funciones de barrel

require "app/all_files.rb"

class DonkeyKongGame
  def initialize(args)
    @args = args 
    @state_machine ||= StateMachine.new(@args)
  end

  def current_screen
    @state_machine.current_state
    #debug
    #@state_machine.state_value.screen
  end

  def debug
    debug_lines = ['hola', 'dice', 'mi', 'cola']
    puts @game_over
    #Text.new(@args, HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT, 10, "Hola").single_line
    #Text.new(@args, HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT, 10, debug_lines).multiple_lines
  
  end

  #HELPER FUNCTIONS

  def tick
    current_screen    
  end
end

def tick (args)
  HelperFunctions.args = args
  args.state.donkey_kong ||= DonkeyKongGame.new(args)
  args.state.donkey_kong.tick
end
