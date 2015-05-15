class Table
  attr_reader :xmax, :ymax

  def initialize(xmax, ymax)
    @xmax = xmax;
    @ymax = ymax;
    @placeable_objects = []
  end

  def still_on_surface?(pos)
    (pos.x >= 0 && pos.x <= xmax && pos.y >= 0 && pos.y <= ymax) if !pos.x.nil? && !pos.y.nil?
  end

  def add_object(position)
    @placeable_objects << position
  end

  def is_object_at(position)
    @placeable_objects.any? { |po| po.x == position.x && po.y == position.y }
  end
end
