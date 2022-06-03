module Action

  @rotations = ['N', 'W', 'S', 'E', 'N', 'E']

  def self.execute_rover_commands(rover_command)
    rover_last_position = @rover_position.clone
    @rover_command.split('').each do |command|
      action(command)
      if rover_is_fell?
        Say.fail(@rover_position, @rover_last_position)
        break
      end
    end
    Say.success(@rover_position)
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