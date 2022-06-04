# frozen_string_literal: true

# Rover's Actions
module Action
  @rotations = %w[N W S E N E]

  def self.execute(command, rover_position)
    case command.upcase
    when 'L', 'R' then rotate(command, rover_position)
    when 'M' then move_forward(rover_position)
    else puts 'unknown command'
    end
    rover_position
  end

  def self.move_forward(rover_position)
    case rover_position[2]
    when 'N' then rover_position[1] += 1
    when 'W' then rover_position[0] += 1
    when 'S' then rover_position[1] -= 1
    when 'E' then rover_position[0] -= 1
    end
    rover_position
  end

  def self.rotate(command, rover_position)
    case command
    when 'L' then rover_position[2] = @rotations[(@rotations.index(rover_position[2]) - 1)]
    when 'R' then rover_position[2] = @rotations[(@rotations.index(rover_position[2]) + 1)]
    end
    rover_position
  end
end
