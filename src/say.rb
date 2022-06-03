module Say
  def self.fail(rover_position, rover_last_position)
    puts <<-here 
    I'm dead! You can find me here #{rover_position}
    But be careful with this place! #{rover_last_position} 
    It's too slippery there
    here
  end

  def self.success(rover_position = '')
    puts <<-here 
    I'm fine! You can find me here #{rover_position}
    here
  end
end