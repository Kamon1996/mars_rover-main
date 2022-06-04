# frozen_string_literal: true

# Rover's replics
module Say
  def self.fail(rover_position, rover_last_position)
    puts <<-HERE
    I'm DEAD! You can find me here #{rover_position}
    But be careful with this place! #{rover_last_position}
    It's too slippery there
    HERE
  end

  def self.success(rover_position = '')
    puts <<-HERE
    I'm fine! You can find me here #{rover_position}
    HERE
  end

  def self.unknown_command(command)
    puts <<-HERE
    I don't know how to execute this command '#{command}'

    HERE
  end

  def self.hi(plateau_size, starting_position, commands)
    puts <<-HERE

    Plateau size: #{plateau_size}

    Starting position: #{starting_position}

    My commands: #{commands}

    HERE
  end
end
