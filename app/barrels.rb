class Barrel
  attr_accessor :x_pos, :y_pos, :width, :height, :jumped_over
  def initialize(x,y)
    @x_pos = x
    @y_pos = y
    @width = 70
    @height = 50
    @stack_size = 100
    @speed = 5
    @jumped_over = false
    destroyed = false
    
  end

  def play
    barrel_movement
    
  end

  def draw_stack
    [x: @x_pos, y: @y_pos, w: @stack_size, h: @stack_size, r: 0, g: 0, b: 255]
  end

  def info
    [x: @x_pos, y: @y_pos, w: @width, h: @height]
  end

  def barrel_movement
    self.x_pos -= @speed
  end

  def bounds_reached
    barrel_bounds_reached ||= false

    if self.x_pos <= 0 - self.width && self.y_pos <= 0
      barrel_bounds_reached = true
    end

    return barrel_bounds_reached
  end

  def add_points
    return 100
  end
end
