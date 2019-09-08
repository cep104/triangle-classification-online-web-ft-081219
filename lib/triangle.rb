

	class Triangle 
	  attr_reader :hypotenuse, :adjacent, :opposite, :sides

   def initialize(hypotenuse, adjacent, opposite)
    @hypotenuse = hypotenuse
    @adjacent = adjacent
    @opposite = opposite
    @sides = [hypotenuse, adjacent, opposite].sort
  end
  
   def invalid_triangle?
    sides.any? { |side| side <= 0 } || sides[0] + sides[1] <= sides[2]
  end
end

   def kind
    if invalid_triangle?
      begin
      raise TriangleError
      rescue TriangleError => error
          puts error.message
        end
    elsif sides.uniq.length == 1
      :equilateral
    elsif sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end



 class TriangleError < StandardError
  def message
    "Not a Triangle"
  end
end