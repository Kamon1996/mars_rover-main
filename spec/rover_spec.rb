# frozen_string_literal: true

require 'spec_helper'
require './src/plateau'

describe Rover do
  describe "Whth params where rover didn't fall" do
    subject do
      Rover.new(Plateau.new('1 2'), '1 1 N', 'LLM')
    end

    it 'should be initialized in correct format' do
      expect(subject.rover_position).to eq([1, 1, 'N'])
      expect(subject.rover_commands).to eq('LLM')
    end

    it 'should return correct final coords and status' do
      subject.execute_rover_commands
      expect(subject.rover_position).to eq([1, 0, 'S'])
      expect(subject.rover_valid?).to eq(true)
    end
  end

  describe 'With params where rover should fall' do
    subject do
      Rover.new(Plateau.new('5 5'), '0 0 N', 'LRMMLRMMMMMMM')
    end

    it 'should return correct final coords and status' do
      subject.execute_rover_commands
      expect(subject.rover_position).to eq([0, 6, 'N'])
      expect(subject.rover_valid?).to eq(false)
    end
  end

  describe 'With params where rover has already fallen' do
    subject do
      Rover.new(Plateau.new('5 5'), '6 5 N', 'MMM')
    end
    it "shouldn't execute commands" do
      subject.execute_rover_commands
      expect(subject.rover_valid?).to eq(false)
      expect(subject.rover_position).to eq([6, 5, 'N'])
    end
  end
end
