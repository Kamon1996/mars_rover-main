# frozen_string_literal: true

require 'spec_helper'

describe Rover do
  describe '#print_info' do
    subject do
      Rover.new('5 5', '1 1 N', 'LLRRLLRR').execute_rover_commands
    end

    it 'returns correct position' do
      expect(subject).to eq([1, 1, 'N'])
    end
  end
end
