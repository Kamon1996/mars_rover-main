# frozen_string_literal: true

require 'spec_helper'

describe Plateau do
  describe "method include?" do
    subject do
      Plateau.new('2 2')
    end
    context "with coords that plateau include" do
      it 'should return true' do
        p subject
        expect(subject.include?(0, 0)).to eq(true)
        expect(subject.include?(0, 1)).to eq(true)
        expect(subject.include?(0, 2)).to eq(true)
        expect(subject.include?(1, 0)).to eq(true)
        expect(subject.include?(1, 1)).to eq(true)
        expect(subject.include?(1, 2)).to eq(true)
        expect(subject.include?(2, 0)).to eq(true)
        expect(subject.include?(2, 1)).to eq(true)
        expect(subject.include?(2, 2)).to eq(true)
      end
    end

    context "with coords that plateau doesn't include" do
      it 'should return false' do
        expect(subject.include?(-1, 0)).to eq(false)
        expect(subject.include?(0, -1)).to eq(false)
        expect(subject.include?(3, 2)).to eq(false)
        expect(subject.include?(2, 3)).to eq(false)
      end
    end
  end
end
