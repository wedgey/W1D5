class Player
  attr_reader :name, :total_score, :score
  attr_accessor :life

  def initialize(name)
    @name = name
    @life = 3
    @score = 0
    @total_score = 0
  end

  def add_score_to_total
    @total_score += @score
  end

  def reset_game
    @score = 0
    @life = 3
  end

  def gain_a_point
    @score += 1
  end

  def lose_a_life
    @life -= 1
  end
end