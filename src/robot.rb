require_relative 'position'
require_relative 'table'

class Robot
  attr_reader :position

  def initialize(table)
    @table = table
    @position = Position.new(0, 0, "NORTH")
  end

  def place(position_string)
    new_position = Position.new(*position_string.split(','))

    if @table.still_on_surface?(new_position) && new_position.orientation_valid?
      @position = new_position
    end
  end

  def move
    pos = @position.clone
    pos.move
    @position.move if @table.still_on_surface?(pos)
  end

  def left
    position.turn_left
  end

  def right
    position.turn_right
  end

  def report(console = true)
    puts position.to_s if console && !position.to_s.nil?
    position.to_s
  end
end
