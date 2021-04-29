class Board
  attr_accessor :array_cases, :winner, :game_nil_variable
 
  def initialize
    @array_cases      = []
    create_case
    @winner = false
    @game_nil_variable = 0
  end

  def create_case
    @array_cases << BoardCase.new("a1")
    @array_cases << BoardCase.new("a2")
    @array_cases << BoardCase.new("a3")
    @array_cases << BoardCase.new("b1")
    @array_cases << BoardCase.new("b2")
    @array_cases << BoardCase.new("b3")
    @array_cases << BoardCase.new("c1")
    @array_cases << BoardCase.new("c2")
    @array_cases << BoardCase.new("c3")
  end

  def play_turn(player)
    system('clear')
    display()
    puts "\033[1;32mC'est ton tour #{player.player}. Que veux-tu jouer ?"+"\033[0m"
    print "> "
    choice = gets.chomp.downcase
    @array_cases.each do |i|
      if choice == i.position && i.case == " "
        i.player_choice(player.pawn)
        victory(player)
      elsif choice == i.position && i.case != " "
        puts "\033[1;31mChoisi une case disponible l'ami !"+"\033[0m"
      end
    end
  end 

  def game_nil
    puts @game_nil_variable = @game_nil_variable + 1
  end

  def victory(player)
    if @array_cases[0].case == "X" && @array_cases[1].case == "X" &&@array_cases[2].case == "X" || @array_cases[0].case == "O" && @array_cases[1].case == "O" && @array_cases[2].case == "O"
      @winner = true
    elsif @array_cases[3].case == "X" && @array_cases[4].case == "X" && @array_cases[5].case == "X" || @array_cases[3].case == "O"  && @array_cases[4].case == "O" && @array_cases[5].case == "O"
      @winner = true
    elsif @array_cases[6].case == "X" && @array_cases[7].case == "X" && @array_cases[8].case == "X" || @array_cases[6].case == "O" && @array_cases[7].case == "O" && @array_cases[8].case == "O"
      @winner = true
    elsif @array_cases[0].case == "X" && @array_cases[3].case == "X" && @array_cases[6].case == "X" || @array_cases[0].case == "O" && @array_cases[3].case == "O" && @array_cases[6].case == "O"
      @winner = true
    elsif @array_cases[1].case == "X" && @array_cases[4].case == "X" && @array_cases[7].case == "X" || @array_cases[1].case == "O" && @array_cases[4].case == "O" && @array_cases[7].case == "O"
      @winner = true
    elsif @array_cases[2].case == "X" && @array_cases[5].case == "X" && @array_cases[8].case == "X" || @array_cases[2].case == "O" && @array_cases[5].case == "O" && @array_cases[8].case == "O"
      @winner = true
    elsif @array_cases[0].case == "X" && @array_cases[4].case == "X" && @array_cases[8].case == "X" || @array_cases[0].case == "O" && @array_cases[4].case == "O" && @array_cases[8].case == "O"
      @winner = true
    elsif @array_cases[6].case == "X" && @array_cases[4].case == "X" && @array_cases[2].case == "X" || @array_cases[6].case == "O" && @array_cases[4].case == "O" && @array_cases[2].case == "O"
      @winner = true
    end
  end

  def display 
    puts "       1         2         3     "
  puts " \033[1;35m -------------------------------"+"\033[0m"
  puts " \033[1;35m |         |         |         |"+"\033[0m"
  puts "A\033[1;35m |    #{@array_cases[0].case}    |    #{@array_cases[1].case}    |    #{@array_cases[2].case}    |"+"\033[0m"
  puts " \033[1;35m |         |         |         |"+"\033[0m"
  puts " \033[1;35m -------------------------------"+"\033[0m"
  puts " \033[1;35m |         |         |         |"+"\033[0m"
  puts "B\033[1;35m |    #{@array_cases[3].case}    |    #{@array_cases[4].case}    |    #{@array_cases[5].case}    |"+"\033[0m"
  puts " \033[1;35m |         |         |         |"+"\033[0m"
  puts " \033[1;35m -------------------------------"+"\033[0m"
  puts " \033[1;35m |         |         |         |"+"\033[0m"
  puts "C\033[1;35m |    #{@array_cases[6].case}    |    #{@array_cases[7].case}    |    #{@array_cases[8].case}    |"+"\033[0m"
  puts " \033[1;35m |         |         |         |"+"\033[0m"
  puts " \033[1;35m -------------------------------"+"\033[0m"
  end


end
