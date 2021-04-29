class BoardCase
 attr_accessor :case, :position

  def initialize(position) #Initialize des cases vides
    @case     = " "
    @position = position
  end

  def player_choice(new_pawn) #Défini les pions dans les cases 
      @case = new_pawn
  end

end