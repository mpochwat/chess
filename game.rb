class Game
	attr_reader :gameboard

	def initialize(player1, player2)
		@gameboard = Board.new
		@white = player1
		@black = player2
	end

	def play

	end

end

class Board
	attr_reader :board

	def initialize
		# Generates initial chess board.
		@board = {[7,0] => Piece.new('rook','b'), [7,1] => Piece.new('knight','b'), [7,2] => Piece.new('bishop','b'), [7,3] => Piece.new('king','b'), [7,4] => Piece.new('queen','b'), [7,5] => Piece.new('bishop','b'), [7,6] => Piece.new('knight','b'), [7,7] => Piece.new('rook','b'), [7,8] => "",
				  [6,0] => Piece.new('pawn','b'), [6,1] => Piece.new('pawn','b'), [6,2] => Piece.new('pawn','b'), [6,3] => Piece.new('pawn','b'), [6,4] => Piece.new('pawn','b'), [6,5] => Piece.new('pawn','b'), [6,6] => Piece.new('pawn','b'), [6,7] => Piece.new('pawn','b'), [6,8] => "",
				  [5,0] => "*", [5,1] => "*", [5,2] => "*", [5,3] => "*", [5,4] => "*", [5,5] => "*", [5,6] => "*", [5,7] => "*", [5,8] => '',
				  [4,0] => "*", [4,1] => "*", [4,2] => "*", [4,3] => "*", [4,4] => "*", [4,5] => "*", [4,6] => "*", [4,7] => "*", [4,8] => '',
				  [3,0] => "*", [3,1] => "*", [3,2] => "*", [3,3] => "*", [3,4] => "*", [3,5] => "*", [3,6] => "*", [3,7] => "*", [3,8] => '',
				  [2,0] => "*", [2,1] => "*", [2,2] => "*", [2,3] => "*", [2,4] => "*", [2,5] => "*", [2,6] => "*", [2,7] => "*", [2,8] => '',
				  [1,0] => Piece.new('pawn','w'), [1,1] => Piece.new('pawn','w'), [1,2] => Piece.new('pawn','w'), [1,3] => Piece.new('pawn','w'), [1,4] => Piece.new('pawn','w'), [1,5] => Piece.new('pawn','w'), [1,6] => Piece.new('pawn','w'), [1,7] => Piece.new('pawn','w'), [1,8] => '',
				  [0,0] => Piece.new('rook','w'), [0,1] => Piece.new('knight','w'), [0,2] => Piece.new('bishop','w'), [0,3] => Piece.new('queen','w'), [0,4] => Piece.new('king','w'), [0,5] => Piece.new('bishop','w'), [0,6] => Piece.new('knight','w'), [0,7] => Piece.new('rook','w'), [0,8] => '',}
		# 50 items in this list. Used to apply 50 moves rule (draw after 50 moves).
		@player = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2]
		@color = ['b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w','b','w']
	end

	# Displays the current board
	def show_board
		@board.values.each do |space|
			if !(space.class == String)
				if (space.type.class == Pawn) && (space.type.color == 'w')
					print "\u2659" + " "
				elsif (space.type.class == Pawn) && (space.type.color == 'b')
					print "\u265F" + " "	
				elsif (space.type.class == Rook) && (space.type.color == 'w')
					print "\u2656" + " "			
				elsif (space.type.class == Rook) && (space.type.color == 'b')
					print "\u265C" + " "		
				elsif (space.type.class == Knight) && (space.type.color == 'w')
					print "\u2658" + " "			
				elsif (space.type.class == Knight) && (space.type.color == 'b')
					print "\u265E" + " "	
				elsif (space.type.class == Bishop) && (space.type.color == 'w')
					print "\u2657" + " "			
				elsif (space.type.class == Bishop) && (space.type.color == 'b')
					print "\u265D" + " "	
				elsif (space.type.class == Queen) && (space.type.color == 'w')
					print "\u2655" + " "			
				elsif (space.type.class == Queen) && (space.type.color == 'b')
					print "\u265B" + " "			
				elsif (space.type.class == King) && (space.type.color == 'w')
					print "\u2654" + " "			
				elsif (space.type.class == King) && (space.type.color == 'b')
					print "\u265A" + " "																													
				else
					print space
				end
			elsif !(space == "")
				print space + " "
			else
				puts space + " "
			end
		end
		puts "---------------"
	end

	# Rotates the board 180 degrees. Occurs when players switch turns.
	def rotate_board
		@board[70] = @board[[7,0]]
		@board[71] = @board[[7,1]]
		@board[72] = @board[[7,2]]
		@board[73] = @board[[7,3]]
		@board[74] = @board[[7,4]]
		@board[75] = @board[[7,5]]
		@board[76] = @board[[7,6]]
		@board[77] = @board[[7,7]]
		@board[60] = @board[[6,0]]
		@board[61] = @board[[6,1]]
		@board[62] = @board[[6,2]]
		@board[63] = @board[[6,3]]
		@board[64] = @board[[6,4]]
		@board[65] = @board[[6,5]]
		@board[66] = @board[[6,6]]
		@board[67] = @board[[6,7]]	
		@board[50] = @board[[5,0]]
		@board[51] = @board[[5,1]]
		@board[52] = @board[[5,2]]
		@board[53] = @board[[5,3]]
		@board[54] = @board[[5,4]]
		@board[55] = @board[[5,5]]
		@board[56] = @board[[5,6]]
		@board[57] = @board[[5,7]]	
		@board[40] = @board[[4,0]]
		@board[41] = @board[[4,1]]
		@board[42] = @board[[4,2]]
		@board[43] = @board[[4,3]]
		@board[44] = @board[[4,4]]
		@board[45] = @board[[4,5]]
		@board[46] = @board[[4,6]]
		@board[47] = @board[[4,7]]				
		@board[[7,0]] = @board[[0,7]]
		@board[[7,1]] = @board[[0,6]]
		@board[[7,2]] = @board[[0,5]]
		@board[[7,3]] = @board[[0,4]]
		@board[[7,4]] = @board[[0,3]]
		@board[[7,5]] = @board[[0,2]]
		@board[[7,6]] = @board[[0,1]]
		@board[[7,7]] = @board[[0,0]]
		@board[[6,0]] = @board[[1,7]]
		@board[[6,1]] = @board[[1,6]]
		@board[[6,2]] = @board[[1,5]]
		@board[[6,3]] = @board[[1,4]]
		@board[[6,4]] = @board[[1,3]]
		@board[[6,5]] = @board[[1,2]]
		@board[[6,6]] = @board[[1,1]]
		@board[[6,7]] = @board[[1,0]]
		@board[[5,0]] = @board[[2,7]]
		@board[[5,1]] = @board[[2,6]]
		@board[[5,2]] = @board[[2,5]]
		@board[[5,3]] = @board[[2,4]]
		@board[[5,4]] = @board[[2,3]]
		@board[[5,5]] = @board[[2,2]]
		@board[[5,6]] = @board[[2,1]]
		@board[[5,7]] = @board[[2,0]]
		@board[[4,0]] = @board[[3,7]]
		@board[[4,1]] = @board[[3,6]]
		@board[[4,2]] = @board[[3,5]]
		@board[[4,3]] = @board[[3,4]]
		@board[[4,4]] = @board[[3,3]]
		@board[[4,5]] = @board[[3,2]]
		@board[[4,6]] = @board[[3,1]]
		@board[[4,7]] = @board[[3,0]]	
		@board[[3,0]] = @board[47]
		@board[[3,1]] = @board[46]
		@board[[3,2]] = @board[45]
		@board[[3,3]] = @board[44]
		@board[[3,4]] = @board[43]
		@board[[3,5]] = @board[42]
		@board[[3,6]] = @board[41]
		@board[[3,7]] = @board[40]	
		@board[[2,0]] = @board[57]
		@board[[2,1]] = @board[56]
		@board[[2,2]] = @board[55]
		@board[[2,3]] = @board[54]
		@board[[2,4]] = @board[53]
		@board[[2,5]] = @board[52]
		@board[[2,6]] = @board[51]
		@board[[2,7]] = @board[50]	
		@board[[1,0]] = @board[67]
		@board[[1,1]] = @board[66]
		@board[[1,2]] = @board[65]
		@board[[1,3]] = @board[64]
		@board[[1,4]] = @board[63]
		@board[[1,5]] = @board[62]
		@board[[1,6]] = @board[61]
		@board[[1,7]] = @board[60]
		@board[[0,0]] = @board[77]
		@board[[0,1]] = @board[76]
		@board[[0,2]] = @board[75]
		@board[[0,3]] = @board[74]
		@board[[0,4]] = @board[73]
		@board[[0,5]] = @board[72]
		@board[[0,6]] = @board[71]
		@board[[0,7]] = @board[70]
		@board.delete(40)
		@board.delete(41)
		@board.delete(42)
		@board.delete(43)
		@board.delete(44)
		@board.delete(45)
		@board.delete(46)
		@board.delete(47)
		@board.delete(50)
		@board.delete(51)
		@board.delete(52)
		@board.delete(53)
		@board.delete(54)
		@board.delete(55)
		@board.delete(56)
		@board.delete(57)
		@board.delete(60)
		@board.delete(61)
		@board.delete(62)
		@board.delete(63)
		@board.delete(64)
		@board.delete(65)
		@board.delete(66)
		@board.delete(67)	
		@board.delete(70)
		@board.delete(71)
		@board.delete(72)
		@board.delete(73)
		@board.delete(74)
		@board.delete(75)
		@board.delete(76)
		@board.delete(77)					
		@board										
	end

	# Determines if square is occupied by another piece.
	def occupied(pos)
		if !( @board[pos] == "*" )
			true
		else
			false
		end
	end	

	def get_input(prompt)
		loop do
			print prompt + ": "
			input = gets.chomp
			return input unless input.empty?
		end
	end	

# This section contains code related to the pawn's moves.

	def legal_pawn(start_arr, finish_arr)
		# If pawn has not moved at all, it can take a double step straight forward.
		if start_arr[0] == 1
			if ( (finish_arr[0] == 2) || (finish_arr[0] == 3) ) && ( finish_arr[1] == start_arr[1] )
				true
			else
				false
			end
		else
			if ( finish_arr[0] == (start_arr[0] + 1) ) && ( finish_arr[1] == start_arr[1] )
				true
			else
				false
			end
		end
	end

	def overtake_pawn(start_arr, finish_arr)
		if ( finish_arr[0] == (start_arr[0] + 1) ) && (( finish_arr[1] == start_arr[1] + 1 ) || ( finish_arr[1] == start_arr[1] - 1 ))
			if occupied(finish_arr)
				true
			end
		else
			false
		end
	end

	def pawn_moves(start_arr, finish_arr)
		color = @color.pop
		# Checks if pawn overtakes another pieces
		if overtake_pawn(start_arr, finish_arr)
			puts "Pawn at #{start_arr} moves to #{finish_arr}."
			puts "You overtook the opponent's #{@board[finish_arr].type.class}!"
			@board[finish_arr] = @board[start_arr]
			@board[start_arr] = "*"
		# Checks if pawn can legally perform the instructed move.
		elsif legal_pawn(start_arr, finish_arr) && !occupied(finish_arr)
			# Case where pawn reaches other side of board. Can be promoted to a new piece.
			if finish_arr[0] == 7
				ans = get_input("You can promote your pawn. Please select what piece you would like to promote it to: Queen, Rook, Knight, Bishop, or Pawn").downcase
				@board[finish_arr] = Piece.new(ans, color)
				@board[start_arr] = "*"
			# All other cases
			else
				puts "Pawn at #{start_arr} moves to #{finish_arr}."
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			end
		end
		puts "---------------"
		show_board
		puts "Switching sides... Player #{@player.pop}'s turn."
		rotate_board
		puts "---------------"
		show_board
	end

# This section contains code related to the rook's moves.

	def legal_rook(start_arr, finish_arr)
		can_move = true
		# Rook moving horizontally
		if finish_arr[0] == start_arr[0]
			# Checks if any squares between start and finish are occupied. If so, cannot move to finish.
			for i in (start_arr[1]+1)..finish_arr[1]
				if occupied([start_arr[0],i])
					can_move = false
				end
			end
		# Rook moving vertically
		elsif finish_arr[1] == start_arr[1]
			# Checks if any squares between start and finish are occupied. If so, cannot move to finish.
			for i in (start_arr[0]+1)..finish_arr[0]
				if occupied([i,start_arr[1]])
					can_move = false
				end
			end
		else
			true
		end
		can_move
	end

	def overtake_rook(start_arr, finish_arr)
		if ( finish_arr[0] == (start_arr[0] + 1) ) && (( finish_arr[1] == start_arr[1] + 1 ) || ( finish_arr[1] == start_arr[1] - 1 ))
			if occupied(finish_arr)
				true
			end
		else
			false
		end
	end

	def rook_moves(start_arr, finish_arr)
		color = @color.pop
		# Checks if rook overtakes another pieces
		if overtake_rook(start_arr, finish_arr)
			puts "Rook at #{start_arr} moves to #{finish_arr}."
			puts "You overtook the opponent's #{@board[finish_arr].type.class}!"
			@board[finish_arr] = @board[start_arr]
			@board[start_arr] = "*"
		# Checks if rook can legally perform the instructed move.
		elsif legal_rook(start_arr, finish_arr) && !occupied(finish_arr)
			puts "Rook at #{start_arr} moves to #{finish_arr}."
			@board[finish_arr] = @board[start_arr]
			@board[start_arr] = "*"
		end
		puts "---------------"
		show_board
		puts "Switching sides... Player #{@player.pop}'s turn."
		rotate_board
		puts "---------------"
		show_board
	end

# This section contains code related to the bishops's moves.

	def legal_bishop(start_arr, finish_arr)
		diagonal = true
		can_move = true
		curr_arr = start_arr
		# Bishop moving up & right
		if finish_arr[0] > start_arr[0] && finish_arr[1] > start_arr[1]
			# Checks if any squares between start and finish are occupied. If so, cannot move to finish.
			# e.g. (0,2) - > (1,3). (4,6) -> (5,7)
			while can_move && !(curr_arr == finish_arr)
				if occupied([curr_arr[0] + 1,curr_arr[1] + 1]) || curr_arr[0] > 7 || curr_arr[1] > 7
					can_move = false
				else
					curr_arr = [curr_arr[0] + 1, curr_arr[1] + 1]
				end
			end
		# Bishop moving up & left
		elsif finish_arr[0] > start_arr[0] && finish_arr[1] < start_arr[1]
			# e.g. (0,2) - > (1,1). (0,2) -> (2,0)
			while can_move && !(curr_arr == finish_arr)
				#p curr_arr
				if occupied([curr_arr[0] + 1,curr_arr[1] - 1]) ||curr_arr[0] > 7 || curr_arr[1] < 1
					can_move = false
				else
					curr_arr = [curr_arr[0] + 1, curr_arr[1] - 1]
				end
			end	
		# Bishop moving down & right
		elsif finish_arr[0] < start_arr[0] && finish_arr[1] > start_arr[1]
			# e.g. (3,5) - > (2,6)
			while can_move && !(curr_arr == finish_arr)
				#p curr_arr
				if occupied([curr_arr[0] - 1,curr_arr[1] + 1]) || curr_arr[0] < 1 || curr_arr[1] > 7
					can_move = false
				else
					curr_arr = [curr_arr[0] - 1, curr_arr[1] + 1]
				end
			end
		# Bishop moving down & left
		elsif finish_arr[0] < start_arr[0] && finish_arr[1] < start_arr[1]
			# e.g. (3,5) - > (2,4)
			while can_move && !(curr_arr == finish_arr)
				#p curr_arr
				if occupied([curr_arr[0] - 1,curr_arr[1] - 1]) || curr_arr[0] < 1 || curr_arr[1] < 1
					can_move = false
				else
					curr_arr = [curr_arr[0] - 1, curr_arr[1] - 1]
				end
			end			
		end			
		p can_move
	end

	def overtake_bishop(start_arr, finish_arr)
		# If piece not empty
		if !(@board[finish_arr] == "*")
			# If pieces not same color
			if !(@board[finish_arr].type.color == @board[start_arr].type.color)
				if occupied(finish_arr)
					true
				end
			end
		else
			false
		end
	end				

	# Clean this up to make more efficeint
	def bishop_moves(start_arr, finish_arr)
		color = @color.pop
		# Checks if rook overtakes another pieces
		if finish_arr[0] > start_arr[0] && finish_arr[1] > start_arr[1]
			if overtake_bishop(start_arr, finish_arr) && legal_bishop(start_arr, [finish_arr[0] - 1, finish_arr[1] - 1])
				puts "Bishop at #{start_arr} moves to #{finish_arr}."
				puts "You overtook the opponent's #{@board[finish_arr].type.class}!"
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			# Checks if rook can legally perform the instructed move.
			elsif legal_bishop(start_arr, finish_arr) && !occupied(finish_arr)
				puts "Bishop at #{start_arr} moves to #{finish_arr}."			
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			end
		elsif finish_arr[0] > start_arr[0] && finish_arr[1] < start_arr[1]
			if overtake_bishop(start_arr, finish_arr) && legal_bishop(start_arr, [finish_arr[0] - 1, finish_arr[1] + 1])
				puts "Bishop at #{start_arr} moves to #{finish_arr}."
				puts "You overtook the opponent's #{@board[finish_arr].type.class}!"
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			# Checks if rook can legally perform the instructed move.
			elsif legal_bishop(start_arr, finish_arr) && !occupied(finish_arr)
				puts "Bishop at #{start_arr} moves to #{finish_arr}."			
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			end
		elsif finish_arr[0] < start_arr[0] && finish_arr[1] > start_arr[1]
			if overtake_bishop(start_arr, finish_arr) && legal_bishop(start_arr, [finish_arr[0] + 1, finish_arr[1] - 1])
				puts "Bishop at #{start_arr} moves to #{finish_arr}."
				puts "You overtook the opponent's #{@board[finish_arr].type.class}!"
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			# Checks if rook can legally perform the instructed move.
			elsif legal_bishop(start_arr, finish_arr) && !occupied(finish_arr)
				puts "Bishop at #{start_arr} moves to #{finish_arr}."			
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			end				
		else
			if overtake_bishop(start_arr, finish_arr) && legal_bishop(start_arr, [finish_arr[0] + 1, finish_arr[1] + 1])
				puts "Bishop at #{start_arr} moves to #{finish_arr}."
				puts "You overtook the opponent's #{@board[finish_arr].type.class}!"
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			# Checks if rook can legally perform the instructed move.
			elsif legal_bishop(start_arr, finish_arr) && !occupied(finish_arr)
				puts "Bishop at #{start_arr} moves to #{finish_arr}."			
				@board[finish_arr] = @board[start_arr]
				@board[start_arr] = "*"
			end			
		end
		puts "---------------"
		show_board
		puts "Switching sides... Player #{@player.pop}'s turn."
		rotate_board
		puts "---------------"
		show_board
	end


end

class Piece
	attr_reader :type

	def initialize(type, color)
		case type
		when "pawn"
			@type = Pawn.new(color)
		when "rook"
			@type = Rook.new(color)
		when "knight"
			@type = Knight.new(color)
		when "bishop"
			@type = Bishop.new(color)
		when "queen"
			@type = Queen.new(color)
		when "king"
			@type = King.new(color)
		else
			@type = "*"
		end
	end

	def type
		@type
	end

end

class Pawn
	attr_reader :color

	def initialize(color)
		@color = color
	end

end

class Rook
	attr_reader :color

	def initialize(color)
		@color = color
	end

end

class Knight	
	attr_reader :color

	def initialize(color)
		@color = color
	end

end

class Bishop
	attr_reader :color

	def initialize(color)
		@color = color
	end

end

class Queen
	attr_reader :color

	def initialize(color)
		@color = color
	end

end

class King
	attr_reader :color

	def initialize(color)
		@color = color
	end

end

victory = false

# Undo this later on
#puts "Enter name of player 1:"
#player1 = gets.chomp.to_s
#puts "Enter name of player 2:"
#player2 = gets.chomp.to_s

game = Game.new('player1', 'player2')
game.gameboard.show_board
game.gameboard.pawn_moves([1,0], [3,0])
game.gameboard.pawn_moves([1,6], [3,6])
game.gameboard.rook_moves([0,0], [2,0])
game.gameboard.pawn_moves([1,0], [3,0])
game.gameboard.rook_moves([2,0], [2,4])
game.gameboard.pawn_moves([1,3], [3,3])
game.gameboard.rook_moves([2,4], [3,4])
game.gameboard.bishop_moves([0,2], [3,5])
game.gameboard.pawn_moves([1,3], [3,3])
game.gameboard.bishop_moves([3,5], [4,4])
game.gameboard.pawn_moves([7,1], [7,2])
game.gameboard.bishop_moves([4,4], [6,2])