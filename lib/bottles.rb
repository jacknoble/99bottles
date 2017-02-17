module BottlesRemaining
  def self.from_verse(n)
    case n
    when 0
      NoMore.new
    when 1
      OneMore.new
    else
      ManyMore.new(n)
    end
  end

  class NoMore
    def to_s
      "no more bottles"
    end

    def drink_or_shop
      "Go to the store and buy some more"
    end

    def next_number
      BottlesRemaining.from_verse(99)
    end

    def capitalize
      to_s.capitalize
    end
  end

  class OneMore
    def to_s
      "1 bottle"
    end

    def drink_or_shop
      "Take it down and pass it around"
    end

    def next_number
      BottlesRemaining.from_verse(0)
    end

    def capitalize
      to_s.capitalize
    end
  end

  class ManyMore
    def initialize(n)
      @num = n
    end

    def to_s
      "#{@num} bottles"
    end

    def drink_or_shop
      "Take one down and pass it around"
    end

    def next_number
      BottlesRemaining.from_verse(@num - 1)
    end

    def capitalize
      to_s.capitalize
    end
  end
end

class Bottles
  def verse(n)
    bottles = BottlesRemaining.from_verse(n)

    <<-STR
#{bottles.capitalize} of beer on the wall, #{bottles} of beer.
#{bottles.drink_or_shop}, #{bottles.next_number} of beer on the wall.
    STR
  end

  def verses(start, fin)
    start.downto(fin).map { |n| verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end
