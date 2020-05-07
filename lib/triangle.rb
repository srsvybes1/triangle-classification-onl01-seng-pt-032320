class Triangle
  attr_accessor :a, :b, :c
@@all = []
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @@all << self
  end

def self.all
  @@all
end
  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    triangle = [ (a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each { |s| self << false if s <= 0}
    raise TriangleError if self.include?(false)
  end
end

class TriangleError < StandardError
end
