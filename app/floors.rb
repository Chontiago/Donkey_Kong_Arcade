class Floors
  attr_accessor :x_pos, :y_pos, :width, :height
  def initialize(x, y, width, height, barrel_direction)
    @x_pos = x
    @y_pos = y
    @width = width 
    @height = height
    @direction = barrel_direction
    @color = [255, 0 , 0]
  end

  def play
    draw
  end

  def draw
    [x: @x_pos, y: @y_pos, w: @width, h: @height, r: @color[0], g: @color[1], b: @color[2]]
  end
end
