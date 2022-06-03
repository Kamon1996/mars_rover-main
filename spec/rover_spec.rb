require 'spec_helper'

describe Rover do
  describe '#print_info' do
    subject do
      Rover.new('5 5', '1 1 N', 'LR').print_info
    end

    it 'returns true' do
      expect(subject).to eq(true)
    end
  end
end
