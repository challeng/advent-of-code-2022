require "pry"
require "rspec"
require "./1.rb"

describe "Day 1" do
  describe "Part 1" do
    it "works with the test input" do
      expect(DayOne.new.part_one("./test_input.txt")).to eq(24000)
    end

    it "works with real solution" do
      expect(DayOne.new.part_one("./input.txt")).to eq(75622)
    end
  end

  describe "Part 2" do
    it "works with the test input" do
      expect(DayOne.new.part_two("./test_input.txt")).to eq(45000)
    end

    it "works with real solution" do
      expect(DayOne.new.part_two("./input.txt")).to eq(213159)
    end
  end
end