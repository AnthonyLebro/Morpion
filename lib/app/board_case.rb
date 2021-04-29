class BoardCase
 attr_accessor :case, :position

  def initialize(position)
    @case     = " "
    @position = position
  end

  def player_choice(new_pawn)
      @case = new_pawn
  end

end