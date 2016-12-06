class Triangle
  attr_accessor :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    raise TriangleError if [a, b, c].any? { |x| x <= 0 }

    sides = [a, b, c].sort

    raise TriangleError unless sides[0] + sides[1] > sides[2]

    if (a == b) && (b == c)
      :equilateral
    elsif (a == b) || (b == c) || (a == c)
      :isosceles
    else
      :scalene
    end
  end
end

class TriangleError < StandardError
end
