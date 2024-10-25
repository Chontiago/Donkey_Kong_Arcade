
module HelperFunctions
  class << self
    attr_accessor :args
  end

  def self.key_pressed_output(key_action, key, output )
    if self.args.inputs.keyboard.send(key_action).send(key)
      output.call
    end
  end

  def self.draw_solids(object)
    self.args.outputs.solids << object
  end

  def self.draw_multiple_solids(array)
    array.each do |elements|
      self.args.outputs.solids << elements.info
    end
  end

  def self.draw_text(object)
    self.args.outputs.labels << object
  end

  def self.draw_text_multiple_lines(array)
    array.each_with_index do |text, index|
      self.args.outputs.labels << [x: @x_pos, y: @y_pos + (@line_skip_space * index) , size_enum: @size, text: text] 
    end
  end

  def self.draw_text_line(x, y, size, text)
    self.args.outputs.labels << [ x: x, y: y, size_enum: size, text: text ]
  end
end