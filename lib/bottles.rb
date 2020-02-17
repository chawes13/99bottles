class Bottles
  attr_reader :bottles
  
  def initialize(bottles: 99)
    @bottles = bottles
  end
  
  def verse(num)
    return last_verse if num == 0
    "#{pluralize_bottle_phrase(num)} of beer on the wall, #{pluralize_bottle_phrase(num)} of beer.#{second_verse(num - 1)}"
  end
  
  def verses(first_verse, last_verse)
    (last_verse..first_verse).to_a.reverse.map { |num| verse(num) }.join("\n")
  end
  
  def song
    verses(bottles, 0)
  end
  
  private
  
  def pluralize_bottle_phrase(val)
    return 'no more bottles' if val == 0
    return '1 bottle' if val == 1
    "#{val} bottles"
  end
  
  def second_verse(num_left)
    descriptor = num_left == 0 ? 'it' : 'one'
    "\nTake #{descriptor} down and pass it around, #{pluralize_bottle_phrase(num_left)} of beer on the wall.\n"
  end
  
  def last_verse
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, #{pluralize_bottle_phrase(bottles)} of beer on the wall.\n"
  end
end
