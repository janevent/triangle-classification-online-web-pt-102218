class Triangle
  attr_accessor :a, :b, :c
  def initialize(a, b, c)
    @a = a 
    @b = b 
    @c = c 
  end
  
  def not_a_triangle 
    if @a <= 0 || @b <= 0 || @c <= 0 
      true
    elsif @a + @b <= @c || @b + @c <= @a || @c + @a <= @b
      true 
    else 
      false 
    end
  end
  
  def kind 
    if not_a_triangle
      begin 
        raise TriangleError 
      rescue TriangleError => error 
        error.message
      end
    elsif @a == @b && @b == @c 
      :equilateral 
    elsif @a == @b || @b == @c || @c == @a 
      :isosceles
    else 
      :scalene
    end
  end
  
  class TriangleError < StandardError 
    def message 
      "This is not a triangle"
    end
  end
  
end
