# frozen_string_literal: true

require_relative 'action'

# Rover
class Rover
  attr_reader :plateau, :start_position, :rover_commands, :rover_position

  def initialize(plateau, start_position, rover_commands)
    @plateau = formatted(plateau)
    @start_position = @rover_position = formatted(start_position)
    @rover_commands = rover_commands
  end

  def execute_rover_commands
    @rover_commands.each_char do |command|
      rover_is_fell? ? break : Action.execute(command, @rover_position)
    end
    @rover_position
  end

  def rover_is_fell?(rover_position: @rover_position, plateau: @plateau)
    !rover_position[0].between?(0, plateau[0]) ||
      !rover_position[1].between?(0, plateau[1])
  end

  private

  def formatted(arr)
    arr.split.map { |e| /\d+/.match?(e) ? e.to_i : e }
  end
end
