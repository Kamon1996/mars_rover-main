# frozen_string_literal: true

require 'matrix'
require_relative 'action'
require_relative 'say'

# Rover
class Rover
  include Action

  attr_reader :plateau, :start_position, :rover_commands

  def initialize(plateau, start_position, rover_commands)
    Say.hi(plateau, start_position, rover_commands)
    @plateau = formatted(plateau)
    @start_position = @rover_position = formatted(start_position)
    @rover_commands = rover_commands
  end

  def execute_rover_commands
    @rover_commands.each_char do |command|
      return Say.fail(@rover_position, @rover_last_position) if rover_is_fell?

      @rover_last_position = @rover_position.clone
      Action.execute(command, @rover_position)
    end
    Say.success(@rover_position)
  end

  def rover_is_fell?(rover_position: @rover_position, plateau: @plateau)
    !rover_position[0].between?(0, plateau[0]) ||
      !rover_position[1].between?(0, plateau[1])
  end

  private

  def formatted(position)
    position.split.map { |e| /\d+/.match?(e) ? e.to_i : e }
  end
end
