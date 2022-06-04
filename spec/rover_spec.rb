# frozen_string_literal: true

require 'spec_helper'

describe Rover do
  describe '#execute_rover_commands' do
    subject do
      Rover.new('5 5', '1 1 N', 'LLRRLLRR').execute_rover_commands
    end

    it 'returns correct message' do
    end
  end
end
