require 'matrix'
require_relative 'action'
require_relative 'say'

class Rover

  attr_reader :plateau, :start_position, :rover_command

  def initialize(plateau, start_position, rover_commands)
    @plateau = plateau_matrix(plateau)
    @rover_position = formating_position(start_position)
    @rover_commands = rover_commands
  end

  def execute_rover_commands
    rover_last_position = ''
    @rover_commands.split('').each do |command|
      rover_last_position = @rover_position.clone
      action(command)
      if rover_is_fell?
        Say.fail(@rover_position, rover_last_position)
        break
      end
    end
    Say.success(@rover_position) unless rover_is_fell?
  end

  def action(command)
    @rover_position = case command.upcase
    when 'L'
      Action.rotate_left(@rover_position)
    when 'R'
      Action.rotate_right(@rover_position)
    when 'M'
      Action.move_forward(@rover_position)
    else
      p "undefined command"
      @rover_position
    end
  end

  private

  def plateau_matrix(plateau)
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

