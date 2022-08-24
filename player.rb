# Player class to deal with players' states and activities
class Player
  attr_accessor :lives, :name

  def initialize(name)
    @lives = 3
    @name = name
  end

  def isAlive?
    @lives == 0 ? false : true
  end

  def killALife
    @lives -= 1
  end

  def addALife
    @lives += 1
  end

  def scoresFull?
    @lives == 3
  end
end

# p1 = Player.new
# puts p1.lives
# puts p1.isAlive?
# puts p1.killALife
# puts p1.isAlive?
# puts p1.killALife
# puts p1.isAlive?
# puts p1.killALife
# puts p1.isAlive?
# puts p1.addALife
# puts p1.lives
# puts p1.isAlive?
