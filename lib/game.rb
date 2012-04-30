require 'pp'

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
    
    ## COMPUTER TURN 1 AND MARK COMPUTER TURN 1
    if @human == @board[1] || @human == @board[3] || @human == @board[5] || @human == @board[7]
      # This is the wrong first move for them. Computer should win.
      puts "Bad decision. I will win."
      @board[4] = @computer
      puts "I select slot 4 for my #{@computer}."
      draw_board
    elsif @human == @board[0] || @human == @board[2] || @human == @board[6] || @human == @board[8]
      puts "I'm impressed. You made a smart first move."
      @board[4] = @computer
      puts "I select slot 4 for my #{@computer}."
      draw_board
    else
      puts "I'm impressed. You made a smart first move. THIRD OPTION"
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
  
    ## NOW FIGURE OUT THE BEST COMPUTER TURN 2.
    ## For now hard code these next few things in.
    ## BEGIN.
    
    @board[8] = @computer
    puts "I picked slot 8."
    draw_board
    
    puts "You pick slot 6."
    @board[6] = @human
    draw_board
    puts "Now it's my turn again."
    
    ## END.
    
    def computer_turn
    	index_position = computer_find_move
    	#Right now computer_find_move is just the entire winning board
    	pp(index_position)
    	@board[index_position] = @computer
    	puts "Is this working?"
    end
    
    @winning_board = [
    	[@board[0], @board[1], @board[2]],
    	[@board[3], @board[4], @board[5]],
    	[@board[6], @board[7], @board[8]],

    	[@board[0], @board[3], @board[6]],
    	[@board[1], @board[4], @board[7]],
    	[@board[2], @board[5], @board[8]],

    	[@board[0], @board[4], @board[8]],
    	[@board[2], @board[4], @board[6]]
    ]
    
    def computer_find_move
      @winning_board.each do |winning_trio|
    	  if times_in_column(winning_trio, @computer) == 2
    		  return empty_in_column(winning_trio)
    	  end
      end
    end
    
    #winning_trio is a trio of slots that give you a win
    #the two parameters passed to times_in_column are the trio of slots that give you a win and the computer's symbol (X or O)
  
  def empty_in_column(array)
  	array.each do |one_slot|
  	  #one_slot is one slot in a winning combination block of 3 slots
  		unless @board[one_slot] == @human || @board[one_slot] == @computer
  		  #unless the spot is taken by the computer or human, return it
  			return one_slot
  		end
  	end
  end
  
  def times_in_column(win_combo, item)
    #win_combo is a trio of slots that give you a win, we iterate through that array, there are three elements in the array
    #item is the computer's symbol (X or O)
  	times_symbol_found = 0
  	win_combo.each do |one_slot|
  	  #one_slot is one slot within a trio of slots that give a win
  		if one_slot == item
  		  times_symbol_found += 1 
  		end
  		#the number of times the computer's symbol is found is increased by 1 each time that there's a match between a slot and the computer's symbol
  		if one_slot == @human
  		  return 0
  		end
  		if time_symbol_found == 2
  		  time_symbol_found
  		end
  	end
  end
  
  computer_turn
  
end
end

Game.new