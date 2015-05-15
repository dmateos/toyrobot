require_relative 'spec_helper'

describe "Table" do
  let(:table) { Table.new(4,4) }

  it "detects if a position is on the tables surface" do
    expect(table.still_on_surface?(Position.new(2, 2, :north))).to eq(true)
  end

  it "detects if a position is outside of the tables surface" do
    expect(table.still_on_surface?(Position.new(5, 4, :north))).to eq(false)
    expect(table.still_on_surface?(Position.new(0, -1, :north))).to eq(false)
  end

  it "can place an object" do
    table.add_object(Position.new(3, 3))
    expect(table.is_object_at(Position.new(3,3))).to eq(true)
    expect(table.is_object_at(Position.new(3,2))).to eq(false)
  end
end
