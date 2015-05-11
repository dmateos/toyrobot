require_relative 'spec_helper'

describe "ToyRobot Integration" do
  let(:stdin) { FakeStdin.new }
  let(:toy_robot) { ToyRobot.new(stdin: stdin) }

  it "runs example 1" do
    stdin << "MOVE" << "REPORT"
    toy_robot.run
    expect(toy_robot.robot.report(false)).to eq("0,1,NORTH")
  end

  it "runs example 2" do
    stdin << "PLACE 1,2,EAST" << "MOVE" << "MOVE" << "LEFT" << "MOVE" << "REPORT"
    toy_robot.run
    expect(toy_robot.robot.report(false)).to eq("3,3,NORTH")
  end

  it "runs example 3" do
    stdin << "PLACE 0,0,NORTH" << "LEFT" << "MOVE" << "MOVE" << "MOVE" << "RIGHT" << "MOVE" << "REPORT"
    toy_robot.run
    expect(toy_robot.robot.report(false)).to eq("0,1,NORTH")
  end

  it "wont place over the edge of the table" do
    stdin << "PLACE 5,5,NORTH"
    toy_robot.run
    expect(toy_robot.robot.position).to_not eq(Position.new(5,5,:north))
  end

  it "will place multiple times" do
    stdin << "PLACE 0,0,NORTH" << "PLACE 1,1,SOUTH"
    toy_robot.run
    expect(toy_robot.robot.position).to eq(Position.new(1, 1, :south))
  end

  it "will place then ignore invalid place" do
    stdin << "PLACE 0,0,NORTH" << "PLACE 0,1,NOTHR" << "MOVE"
    toy_robot.run
    expect(toy_robot.robot.position).to eq(Position.new(0, 1, :north))
  end

  it "wont go over edge of table" do
    stdin << "PLACE 0,3,NORTH" << "MOVE" << "MOVE"
    toy_robot.run
    expect(toy_robot.robot.position).to eq(Position.new(0, 4, :north))
  end

  it "turns and moves north" do
    stdin << "PLACE 0,0,EAST" << "LEFT" << "MOVE"
    toy_robot.run
    expect(toy_robot.robot.position).to eq(Position.new(0, 1, :north))
  end

  it "turns and moves east" do
    stdin << "PLACE 0,0,NORTH" << "RIGHT" << "MOVE"
    toy_robot.run
    expect(toy_robot.robot.position).to eq(Position.new(1, 0, :east))
  end

  it "turns and moves south" do
    stdin << "PLACE 0,1,WEST" << "LEFT" << "MOVE"
    toy_robot.run
    expect(toy_robot.robot.position).to eq(Position.new(0, 0, :south))
  end

  it "turns and moves west" do
    stdin << "PLACE 1,0,SOUTH" << "RIGHT" << "MOVE"
    toy_robot.run
    expect(toy_robot.robot.position).to eq(Position.new(0, 0, :west))
  end
end
