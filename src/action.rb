module Action

  @rotations = ['N', 'W', 'S', 'E', 'N', 'E']


  def self.execute(command, rover_position = @rover_position)
    rover_position = case command.upcase
    when 'L'
      rotate_left(rover_position)
    when 'R'
      rotate_right(rover_position)
    when 'M'
      move_forward(rover_position)
    else
      Say.unknown_command(command)
      rover_position
    end
  end

  def self.move_forward(rover_position)
    case rover_position[2]
    when 'N'
      rover_position[1] += 1
    when 'W'
      rover_position[0] += 1
    when 'S'
      rover_position[1] -= 1
    when 'E'
      rover_position[0] -= 1
    end
    rover_position
  end

  def self.rotate_left(rover_position)
    rover_position[2] = @rotations[(@rotations.index(rover_position[2]) - 1)]
    rover_position
  end

  def self.rotate_right(rover_position)
    rover_position[2] = @rotations[(@rotations.index(rover_position[2]) + 1)]
    rover_position
  end

end