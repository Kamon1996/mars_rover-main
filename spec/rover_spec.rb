# frozen_string_literal: true

require 'spec_helper'

describe Rover do
  describe "Whth params where rover didn't fall" do
    subject do
      Rover.new('5 5', '1 1 N', 'LLM')
    end

    it 'should be initialized in correct format' do
      expect(subject.start_position).to eq([1, 1, 'N'])
      expect(subject.rover_position).to eq([1, 1, 'N'])
      expect(subject.plateau).to eq([5, 5])
      expect(subject.rover_commands).to eq('LLM')
    end

    it 'should return correct final coords and status' do
      subject.execute_rover_commands
      expect(subject.rover_position).to eq([1, 0, 'S'])
      expect(subject.rover_is_fell?).to eq(false)
    end
  end

  describe 'With params where rover should fall' do
    subject do
      Rover.new('5 5', '0 0 N', 'LRMMLRMMMMM')
    end

    it 'should return correct final coords and status' do
      subject.execute_rover_commands
      expect(subject.rover_position).to eq([0, 6, 'N'])
      expect(subject.rover_is_fell?).to eq(true)
    end
  end

  describe 'With params where the rover has already fallen' do
    subject do
      Rover.new('5 5', '6 5 N', 'MMM')
    end

    it "shouldn't execute commands" do
      subject.execute_rover_commands
      expect(subject.rover_is_fell?).to eq(true)
      expect(subject.rover_position).to eq([6, 5, 'N'])
    end
  end
end
