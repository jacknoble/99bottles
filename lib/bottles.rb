class Bottles
  def verse(n)
    <<-STR
#{bottles(n).capitalize} of beer on the wall, #{bottles(n)} of beer.
#{strategy_for_drinking_more(n)}, #{bottles((n - 1) % 100)} of beer on the wall.
     STR
  end

  def verses(start, fin)
    start.downto(fin).map { |n| verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def bottles(n)
    case n
    when 0
      "no more bottles"
    when 1
      "1 bottle"
    else
      "#{n} bottles"
    end
  end

  def strategy_for_drinking_more(n)
    case n
    when 0
      "Go to the store and buy some more"
    when 1
      "Take it down and pass it around"
    else
      "Take one down and pass it around"
    end
  end
end
