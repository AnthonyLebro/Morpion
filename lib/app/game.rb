class Game
  attr_accessor :player_array, :board

  def initialize()                               
    @player_array = []
    @board = Board.new 
  end
  
  def players()
    2.times do |i|
      puts "---------------------------------------"
      puts "\033[1;32mSalut joueur#{i+1} choisis ton nom :"+"\033[0m"
      print "> "
      name = gets.chomp.to_s
      puts ""
      puts "\033[1;35mQuel pion veux-tu ? (X ou O)"+"\033[0m"
      print "\033[1;35m> "+"\033[0m"
      pawn = gets.chomp.to_s
      puts "Bon choix!"
      @player_array << Player.new(name,pawn) 
    end
  end

  def choose_case(player)
    @board.play_turn(player)
    @board.game_nil
    if @board.winner == true
      system('clear')
      @board.display
      player.win_count
      puts "\033[1;31mBravo #{player.player}!! Tu as gagné !!"+"\033[0m"
    elsif @board.game_nil_variable == 9
      system('clear')
      @board.display
      puts "\033[1;31mla partie est finie, partie nul!!"+"\033[0m"
      puts "" 
    end
  end

  def game_round
    while @board.winner == false 
      choose_case(@player_array[0])
      if @board.winner == true
        break
      elsif
        @board.game_nil_variable == 9
        break
      else
        choose_case(@player_array[1])
      end
    end
  end

  def restart
    puts "SCORE #{@player_array[0].player} - #{@player_array[0].score} points"
    puts "SCORE #{@player_array[1].player} - #{@player_array[1].score} points"
    puts "" 
    puts "---------------------------------------"
    puts "C'était une super partie, veux tu rejouer ?"
    puts "(écris 'oui' ou 'non')"
    print "> "
    answer=gets.chomp.downcase
    if answer == "oui"
      system('clear')
      @board.array_cases.each {|cases| cases =" "}
      @board.game_nil_variable = 0
      self.perform_restart
    end
  end

  def start 
    puts ""
    puts "\033[3;35m---------------------------------------"
    puts "            Welcome to "
    puts "         The Morpion Game         "
    puts "---------------------------------------"+"\033[0m"
    puts "created by Antho Pascaline & Xabi  🤟"
  end

  def perform_restart
    @board = Board.new 
    start()
    sleep 2 
    game_round()
    restart()
  end

  def perform
      start() 
      players()
      game_round()
      restart()
  end

end