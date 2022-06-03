require 'matrix'

class App

  attr_accessor :plateau, :rover_position

  def initialize()
    @plateau = create_plateau
    @rover_position = create_position
  end

  def action
    action = gets.chomp.upcase!
    case action
    when 'L' then rotate('')
    when 'R' then
    when 'M' then
    else then 'undefined command' 
  end



  private

  def create_plateau
    p "puts size plateau x"
    x = gets.to_i
    p "puts size plateau y"
    y = gets.to_i
    Matrix.zero(x, y).to_a
  end

  def create_position
    p "enter position rover X"
    x = gets.to_i
    p "enter position rover Y"
    y = gets.to_i
    p "enter navigation rover: 'N' 'W' 'E' 'S' "
    nav = gets.chomp.upcase!
    [x, y, nav]
  end

end


if __FILE__ == $PROGRAM_NAME
  app = App.new

end










