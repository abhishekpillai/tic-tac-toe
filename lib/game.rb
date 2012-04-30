class Game

  def draw_board
    print "\n\n"
        print " #{@board[0]} |"
        print " #{@board[1]} |"
        print " #{@board[2]}"		
        print "\n---+---+---\n"
        print " #{@board[3]} |"
        print " #{@board[4]} |"
        print " #{@board[5]}"
        print "\n---+---+---\n"
        print " #{@board[6]} |"
        print " #{@board[7]} |"
        print " #{@board[8]}"
        print "\n\n"
  end

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    
    draw_board
    
    options = ['X', 'O']
    @computer = options.sample
		if @computer == 'X'
		  @human = 'O'
		else
		  @human = 'X'
		end
    
    puts "Hello and welcome to Tic Tac Toe."
    puts "You will be #{@human} and I will let you go first. There are 255,168 possible way this game could go and in 131,184 of them you win. This will not be one of those times."
    puts "Please enter a number to select the slot you'd like to put your #{@human}."
    
    ## HUMAN TURN 1
    selection = gets.chomp.to_i
    
    ## MARK HUMAN TURN 1
    @board[selection] = @human
    
    draw_board

    selection_string = selection.to_s
    puts @board[selection]
    
    ## COMPUTER TURN 1 AND MARK COMPUTER TURN 1
    if selection_string == @board[1] || @board[3] || @board[5] || @board[7]
      # This is the wrong first move for them. Computer should win.
      puts "Bad decision. I will win."
      @board[4] = @computer
      puts "I select slot 4 for my #{@computer}."
      draw_board
    elsif selection_string == @board[0] || @board[2] || @board[6] || @board[8]
      puts "I'm impressed. You made a smart first move."
      @board[4] = @computer
      puts "I select slot 4 for my #{@computer}."
      draw_board
    else
      puts "Alright, good move."
      @board[0] = @computer
      puts "I select slot 0 for my #{@computer}."
      draw_board
    end
    
    ## HUMAN TURN 2
    puts "Now it's your turn again. Select a slot."
    selection = gets.chomp.to_i
    
    ## MARK HUMAN TURN 2
    @board[selection] = @human
    draw_board
    puts "You selected slot #{selection}. Now it's my turn."
  end

end

Game.new