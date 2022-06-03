require 'matrix'
require_relative 'action'
require_relative 'say'

class Rover

  attr_reader :plateau, :start_position, :rover_commands

  def initialize(plateau, start_position, rover_commands)
    Say.hi(plateau, start_position, rover_commands)
    @plateau = make_matrix(plateau)
    @start_position = @rover_position = formating_position(start_position)
    @rover_commands = formating_commands(rover_commands)
  end

  def execute_rover_commands
    @rover_commands.each do |command|
      @rover_last_position = @rover_position.clone
      Action.execute(command, @rover_position)
      break if rover_is_fell?
    end

    if rover_is_fell?
      Say.fail(@rover_position, @rover_last_position)
    else 
      Say.success(@rover_position)
    end
  end

  private

  def formating_commands(commands)
    commands.split('')
  end

  def make_matrix(plateau)
    x, y = plateau.split().map { |arg| arg.to_i }
    Matrix.zero(y, x).to_a
  end

  def formating_position(position)
    position = position.split()
    position[0] = position[0].to_i
    position[1] = position[1].to_i
    position
  end

  def rover_is_fell?(rover_position: @rover_position, plateau: @plateau)
    rover_position[0] > plateau.length || 
      rover_position[0] < 0 ||
      rover_position[1] > plateau[0].length ||
      rover_position[1] < 0
  end
end

