# frozen_string_literal: true

# Rover's Actions
class Plateau

  def initialize(coords_str, shape = 'pr')
    @plateau = formatted(coords_str)
    @shape = shape
    get_shape
  end

  def is_include?(coords)
    case @shape
    when 'pr' then @plateau[coords[0] - 1] && @plateau[coords[0] - 1][coords[1] - 1] ? true : false
    when 'cr' then p 'circle validation'
    when 'tr' then p 'triangle validation'
    end
  end

  def get
    @plateau
  end

  private

  def formatted(str)
    str = str.split().map! { |e| /\d+/.match?(e) ? e.to_i : e }
  end

  def get_shape
    case @shape
    when 'pr' then make_parallelagram
    when 'cr' then make_circle            
    when 'tr' then make_triangle
    end
  end

  def make_parallelagram
    @plateau = Array.new(@plateau[0]) { Array.new(@plateau[1], 0) }
  end
  
end
