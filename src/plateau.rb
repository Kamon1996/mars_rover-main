# frozen_string_literal: true

# Rover's Actions
class Plateau

  def initialize(coords_str)
    @plateau = formatted(coords_str)
  end

  def is_include?(x, y)
    x.between?(0, @plateau[0]) && y.between?(0, @plateau[1])
  end

  private

  def formatted(coords_str)
    coords_str.split.map! { |e| /\d+/.match?(e) ? e.to_i : e }
  end

end
