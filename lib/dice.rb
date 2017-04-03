module Dice

  def D(sides)
    return rand(sides) + 1
  end

  def roll(sides, num)
    total = 0
    num.times do
      total += rand(sides) + 1
    end
    return total
  end

end
