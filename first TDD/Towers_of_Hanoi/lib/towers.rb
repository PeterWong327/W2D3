class Towers
  attr_accessor :piles
  def initialize
    @piles = [[3,2,1],[],[]]  # disc = piles[0].last
  end

  def move(t1, t2)
    raise ArgumentError unless t1.between?(0, 2) && t2.between?(0, 2)
    raise StandardError.new "The selected tower is empty" if piles[t1].empty?
    raise StandardError.new "You cannot put a bigger disc on top of a smaller disc" unless piles[t2].empty? || (piles[t1].last < piles[t2].last)
    raise StandardError.new "You have to select a different tower to move to" if t1 == t2
    @piles[t2].push(@piles[t1].pop)
  end

  def won?
    @piles[0].empty? && (@piles[1].empty? || @piles[2].empty?)
  end
end
