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
end
