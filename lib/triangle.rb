class Triangle
  # write code here
  attr_reader :x, :y, :z

  def initialize (x, y, z) #Triangle class that accepts three arguments on initialization. Each argument is a length of one of the three sides of the triangle.
    @x = x
    @y = y
    @z = z
  end

  def kind #to raise a custom error if the triangle is not valid. the kind method returns, as a symbol, its type=>:equilateral,:isosceles, :scalene
    type_validity_check
    if x == y && y == z
      :equilateral
    elsif x ==y || y == z || x == z
      :isosceles
    else
      :scalene
    end
  end

  def greater_than_zero_side_check
    [x, y, z].all?(&:positive?)
  end

  def triangle_inequality_check
    x + y > z && y + z > x && x + z >y
  end

  def confirm_triangle_validity
    raise TriangleError unless greater_than_zero_side_check? && triangle_inequality_check?
  end

  class TriangleError < StandardError
  end
end
