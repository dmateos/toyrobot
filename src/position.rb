class Position
  attr_reader :orientation, :x, :y

  def initialize(x = 0, y = 0, o = nil)
    @x = x.to_i
    @y = y.to_i
    self.orientation = o.downcase.to_sym if not o.nil?
  end

  def orientation=(new_orientation)
    @orientation = new_orientation if orientation_valid?(new_orientation)
  end

  def ==(other)
    x == other.x && y == other.y && orientation == other.orientation
  end

  def turn_left
    self.orientation = {north: :west, west: :south, south: :east, east: :north}[orientation]
  end

  def turn_right
    self.orientation = {north: :east, east: :south, south: :west, west: :north}[orientation]
  end

  def move
    case orientation
    when :north; @y += 1
    when :south; @y -= 1
    when :east; @x += 1
    when :west; @x -= 1
    end
  end

  def to_s
    "#{x},#{y},#{orientation.upcase}"
  end

  def orientation_valid?(o = nil)
    o ||= orientation
    [:north,  :south, :east, :west].include?(o)
  end
end
