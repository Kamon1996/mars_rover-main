# frozen_string_literal: true

require_relative 'plateau'

# Rover
class Rover
  ROTATIONS = %w[N E S W]
  attr_reader :plateau, :rover_commands, :rover_position

  def initialize(plateau, start_position, rover_commands)
    @plateau = plateau
    @rover_position = formatted(start_position)
    @rover_commands = rover_commands
  end

  def execute_rover_commands(commands = @rover_commands)
    commands.each_char do |command|
      rover_valid? ? execute_command(command) : break
    end
    p @rover_position
  end

  def execute_command(command)
    case command
    when 'L' then @rover_position[2] = ROTATIONS[(ROTATIONS.index(rover_position[2]) - 1)]
    when 'R' then @rover_position[2] =
                    @rover_position[2] == 'W' ? 'N' : ROTATIONS[(ROTATIONS.index(rover_position[2]) + 1)]
    when 'M' then move_forward
    else p "Unknown command #{command}"
    end
    @rover_position
  end

  def rover_valid?
    @plateau.include?(@rover_position[0], @rover_position[1])
  end

  private

  def move_forward
    case @rover_position[2]
    when 'N' then @rover_position[1] += 1
    when 'W' then @rover_position[0] -= 1
    when 'S' then @rover_position[1] -= 1
    when 'E' then @rover_position[0] += 1
    end
    @rover_position
  end

  def formatted(str)
    str.split.map { |e| /\d+/.match?(e) ? e.to_i : e }
  end
end
