#Mejorar posición x de dk y de barrel_stack

require 'app/helper_functions.rb'
require 'app/collisions.rb'

class Gameplay
attr_accessor :current_game_state
  def initialize(score)
    @score = score
    @current_game_state ||= 'gameplay'
    @points = 0
    @timer = 0
    @jumpman ||= Jumpman.new(0 , 0)
    @donkey_kong ||= DK.new(FULL_SCREEN_WIDTH - 200, 0)
    @bottom_floor ||= Floors.new(0, -FLOOR_HEIGHT, FULL_SCREEN_WIDTH, 20, 'left')
    @barrel_stack = Barrel.new(FULL_SCREEN_WIDTH - 100, 0) #Just a visual of the stack where dk gets hthe barrels from    
    @barrels ||= [Barrel.new(FULL_SCREEN_WIDTH - 300, 0)]
  end 
 
  def screen
    floors
    jumpman
    donkey_kong
    barrels
    score
    render_gameplay
    state_changes
    #debug
    #puts @current_game_state
    
  end
 
  def jumpman
    @jumpman.play
    Collisions.collision_with_floor(@all_floors, @jumpman)
    side_bounds(@jumpman)
  end

  def donkey_kong
    
  end

  def floors
    @all_floors = [@bottom_floor]
  end

  def barrels
    @barrels.each do |barrel|
      barrel.play
    end
    generate_barrels
    destroy_objects_outside_of_screen(@barrels)

     #puts generate_barrels
    
  end

  def score
    #@score.jump_over_obstacle_points(@jumpman, @barrel)
    @score.score_limit
    
      @barrels.each do |barrel|
        @score.jump_over_obstacle_points(@jumpman, barrel)
    end
  end

  def render_gameplay
    HelperFunctions.draw_solids(@jumpman.draw)
    HelperFunctions.draw_solids(@bottom_floor.draw)
    HelperFunctions.draw_solids(@donkey_kong.draw)
    HelperFunctions.draw_solids(@barrel_stack.draw_stack)
    HelperFunctions.draw_text(@score.draw_score_in_gameplay)
    HelperFunctions.draw_multiple_solids(@barrels)

  end

  def current_screen
    return @current_game_state
  end


  def state_changes
    game_over(@jumpman, @barrels, 'lose' ) 
    game_over(@jumpman, [@donkey_kong] , 'win')
    
  end

  def game_over(player, obstacles, string) #string takes win or lose to show the corresponding game_over_screen
    obstacles.each do |obstacle|
      if Collisions.regular_collision(player, obstacle)
        @current_game_state = string
      end 
    end
  end

  def generate_barrels
    spawn_new_barrel_flag = SpawnPoint.new(FULL_SCREEN_WIDTH - 600, 0)
    
    @barrels.each do |barrel|
      if Collisions.collision_with_spawn_flag(spawn_new_barrel_flag, barrel)
        @barrels.append(Barrel.new(FULL_SCREEN_WIDTH - 300, 0))
      end
    end
  end

  def destroy_objects_outside_of_screen(object_array)
    object_array.each_with_index do |object, index|
      if object.bounds_reached
        object_array.delete_at(index)
      end
    end
  end

  def debug
    #puts current_screen
  end
  #AUXILIARY METHODS
  def side_bounds(object)
    left_bound = LEFT_BORDER
    right_bound = RIGHT_BORDER - object.width
 
     object.x_pos = [object.x_pos, left_bound].max
     object.x_pos = [object.x_pos, right_bound].min
   end

   

end