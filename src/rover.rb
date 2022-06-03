class Rover
  attr_reader :plateau, :start_position, :rover_command

  def initialize(plateau, start_position, rover_command)
    @plateau = plateau
    @start_position = start_position
    @rover_command = rover_command
  end

  def print_info
    puts "good luck!"
    puts "The plateau dimensions is #{plateau}"
    puts "The rover start position is #{start_position}"
    puts "The command is #{rover_command}"

    true
  end
end
