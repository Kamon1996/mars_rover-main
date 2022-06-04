# frozen_string_literal: true

require_relative './rover'

plateau = ARGF.gets.chomp
start_position = ARGF.gets.chomp
rover_commands = ARGF.gets.chomp
rover = Rover.new(plateau, start_position, rover_commands)
rover.execute_rover_commands
