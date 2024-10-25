require 'app/helper_functions.rb'

class Jumpman
  attr_accessor :x_pos, :y_pos, :width, :height, :touching_the_floor, :jump_peak
  def initialize(x, y)
    @x_pos = x
    @y_pos = y
    @width = 50
    @height = 50
    @speed = 3
    @jumping ||= false
    @touching_the_floor ||= false
    @jump_peak = 100
    
  end

  def play
    move
    jump_conditions
    jump
    jump_end
    fall
    
    debug
  end

  def draw
    {x: @x_pos, y: @y_pos, w: @width, h: @height}
  end
  
  def move
    move_left = lambda {self.x_pos -=@speed}
    move_right = lambda {self.x_pos +=@speed}

    HelperFunctions.key_pressed_output(:key_held, :left, move_left )
    HelperFunctions.key_pressed_output(:key_held, :right, move_right)
  end

  def jump_conditions
    jump = lambda {
      @jumping = true
      @touching_the_floor = false
    }
    
    if @touching_the_floor
      HelperFunctions.key_pressed_output(:key_down, :space, jump)
    end
  end
  
  def jump
    
    if @jumping
      self.y_pos += GRAVITY
    end
  
  end

  def jump_end
    if self.y_pos >= @jump_peak
      @jumping = false
      @touching_the_floor = false # Solo es para arreglar bug con el primer brinco
    end
  end
  
  def fall
    @fall = lambda {self.y_pos -= GRAVITY}

    if !@jumping && !@touching_the_floor
      @fall.call
    end
  end

  def has_hammer
  
  end

  def jump_points 
    
  end

  def debug
    #puts @touching_the_floor
  end
end
