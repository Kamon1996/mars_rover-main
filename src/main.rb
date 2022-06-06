# frozen_string_literal: true

require_relative './rover'
require_relative 'plateau'

plateau = Plateau.new(ARGF.gets.chomp).get
start_position = ARGF.gets.chomp
rover_commands = ARGF.gets.chomp
Rover.new(plateau, start_position, rover_commands).execute_rover_commands
