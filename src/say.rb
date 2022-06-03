module Say
  def self.fail(rover_position, rover_last_position)
    puts <<-here 
    I'm DEAD! You can find me here #{rover_position}
    But be careful with this place! #{rover_last_position} 
    It's too slippery there
    here
  end

  def self.success(rover_position = '')
    puts <<-here 
    I'm fine! You can find me here #{rover_position}
    here
  end

  def self.unknown_command(command)
    puts <<-here 
    I don't know how to execute this command '#{command}'

    here
  end

  def self.hi(plateau_size, starting_position, commands)
    puts <<-here

    Plateau size: #{plateau_size}

    Starting position: #{starting_position}

    My commands: #{commands}

    here
  end
end