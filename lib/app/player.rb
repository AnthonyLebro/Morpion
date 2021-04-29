class Player #methode qui défini le compte du score
  attr_accessor :player, :pawn, :score

  def initialize(player, pawn)
    @player = player
    @pawn   = pawn.upcase
    @score  = 0
  end

  def win_count
    @score = @score + 1
  end 

end