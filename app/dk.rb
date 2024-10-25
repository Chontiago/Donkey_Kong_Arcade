class DK
  attr_accessor :x_pos, :y_pos, :width, :height
  def initialize(x, y, size=100)
    @x_pos = x
    @y_pos = y
    @width = size
    @height = size

  end

  def gameplay 
  end

  def draw
    [x: @x_pos, y: @y_pos, w: @width, h: @height]
  end
end