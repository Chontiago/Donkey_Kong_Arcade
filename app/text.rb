class Text
  def initialize(args, x, y, text, size=10, line_skip=80)
    @args = args
    @x_pos = x 
    @y_pos = y
    @size = size
    @text = text
    @line_skip_space = line_skip
    
  end

  def single_line
    @args.outputs.labels << [x: @x_pos, y: @y_pos, size_enum: @size, text: @text]
  end

  def multiple_lines
    @text.each_with_index do |text, index|
      @args.outputs.labels << [x: @x_pos, y: @y_pos + (@line_skip_space * index) , size_enum: @size, text: text] 
    end
  end
end
