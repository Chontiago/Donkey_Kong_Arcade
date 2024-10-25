require 'app/collisions.rb'

class Score
  attr_accessor :x_pos, :y_pos, :current_score
  def initialize
    @x_pos = HALF_SCREEN_WIDTH
    @y_pos = HALF_SCREEN_HEIGHT
    @current_score ||= 0
    @size = 5
    @text = "SCORE: 9999"
    @width = (@text.length * 10) + (@text.length * @size) 
    @height = 20 + (@size * 2)
    @scored = false
    
    #@update = false
    #@new_score = new_score
  end

  def draw_score_in_gameplay
    [x: FULL_SCREEN_WIDTH - @width , y: FULL_SCREEN_HEIGHT - @height, size_enum: @size, text: "SCORE " + "#{@current_score}" ]
  end

  def draw_score_in_game_over
    [HALF_SCREEN_WIDTH - @width , HALF_SCREEN_HEIGHT - @height, size_enum: @size, text: @text]
  end

  def score_limit
    if @current_score >= 9999
      @current_score = 9999
    end
  end
  
  # add_points_methods
  

  def jump_over_obstacle_points(box1, box2)
    if Collisions.jumped_obstacle(box1, box2)
      
      @current_score += box2.add_points
    end
  
  end
  

end
