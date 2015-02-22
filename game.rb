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
		@board = {[7,0] => nil, [7,1] => nil, [7,2] => nil, [7,3] => nil, [7,4] => nil, [7,5] => nil, [7,6] => nil, [7,7] => nil,
				  [6,0] => nil, [6,1] => nil, [6,2] => nil, [6,3] => nil, [6,4] => nil, [6,5] => nil, [6,6] => nil, [6,7] => nil,
				  [5,0] => nil, [5,1] => nil, [5,2] => nil, [5,3] => nil, [5,4] => nil, [5,5] => nil, [5,6] => nil, [5,7] => nil,
				  [4,0] => nil, [4,1] => nil, [4,2] => nil, [4,3] => nil, [4,4] => nil, [4,5] => nil, [4,6] => nil, [4,7] => nil,
				  [3,0] => nil, [3,1] => nil, [3,2] => nil, [3,3] => nil, [3,4] => nil, [3,5] => nil, [3,6] => nil, [3,7] => nil,
				  [2,0] => nil, [2,1] => nil, [2,2] => nil, [2,3] => nil, [2,4] => nil, [2,5] => nil, [2,6] => nil, [2,7] => nil,
				  [1,0] => nil, [1,1] => nil, [1,2] => nil, [1,3] => nil, [1,4] => nil, [1,5] => nil, [1,6] => nil, [1,7] => nil,
				  [0,0] => nil, [0,1] => nil, [0,2] => nil, [0,3] => nil, [0,4] => nil, [0,5] => nil, [0,6] => nil, [0,7] => nil}
		@pieces = [Piece.new('pawn','w', [1,0]), Piece.new('pawn','w', [1,1]), Piece.new('pawn','w', [1,2]), Piece.new('pawn','w', [1,3]), 
				   Piece.new('pawn','w', [1,4]), Piece.new('pawn','w', [1,5]), Piece.new('pawn','w', [1,6]), Piece.new('pawn','w', [1,7]),
				   Piece.new('rook','w', [0,0]), Piece.new('knight','w', [0,1]), Piece.new('bishop','w', [0,2]), Piece.new('queen','w', [0,3]),
				   Piece.new('king','w', [0,4]), Piece.new('bishop','w', [0,5]), Piece.new('knight','w', [0,6]), Piece.new('rook','w', [0,7]),
			  	   Piece.new('pawn','b', [6,0]), Piece.new('pawn','b', [6,1]), Piece.new('pawn','b', [6,2]), Piece.new('pawn','b', [6,3]), 
				   Piece.new('pawn','b', [6,4]), Piece.new('pawn','b', [6,5]), Piece.new('pawn','b', [6,6]), Piece.new('pawn','b', [6,7]),
				   Piece.new('rook','b', [7,0]), Piece.new('knight','b', [7,1]), Piece.new('bishop','b', [7,2]), Piece.new('king','b', [7,3]),
				   Piece.new('queen','b', [7,4]), Piece.new('bishop','b', [7,5]), Piece.new('knight','b', [7,6]), Piece.new('rook','b', [7,7])]		
	end

	def rotate_board
		# Creates a temp board to store values
		@board = @board
		#p @board
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
		p @board										
	end

	def show_board
		p @board.values
	end

	def place_pieces
		@pieces.each do |piece|
			@board[piece.type.position] = piece.type
		end
	end

	def occupied(pos)
		if !@board[pos].nil?
			true
		else
			false
		end
	end	

	def legal_pawn(start_arr, finish_arr)
		if start_arr[0] == 1
			if ( (finish_arr[0] == 2) || (finish_arr[0] == 3) ) && ( finish_arr[1] == start_arr[1] )
				true
			else
				false
			end
		else
			if ( finish_arr[0] == 2 ) && ( finish_arr[1] == start_arr[1] )
				true
			else
				false
			end
		end
	end

	def pawn_moves(start_arr, finish_arr)
		@board[start_arr] 
		if legal_pawn(start_arr, finish_arr) && !occupied(finish_arr)
			@board[finish_arr] = @board[start_arr]
			@board[start_arr] = nil
		end
	end

end

class Piece
	attr_reader :type

	def initialize(type, color, position)
		case type
		when "pawn"
			@type = Pawn.new(color, position)
		when "rook"
			@type = Rook.new(color, position)
		when "knight"
			@type = Knight.new(color, position)
		when "bishop"
			@type = Bishop.new(color, position)
		when "queen"
			@type = Queen.new(color, position)
		when "king"
			@type = King.new(color, position)
		else
			@type = nil
		end
	end

	def type
		@type
	end

end

class Pawn
	attr_reader :position

	def initialize(color, position)
		@color = color
		@position = position
	end

end

class Rook
	attr_reader :position

	def initialize(color, position)
		@color = color
		@position = position
	end

end

class Knight
	attr_reader :position	

	def initialize(color, position)
		@color = color
		@position = position
	end

end

class Bishop
	attr_reader :position

	def initialize(color, position)
		@color = color
		@position = position
	end

end

class Queen
	attr_reader :position

	def initialize(color, position)
		@color = color
		@position = position
	end

end

class King
	attr_reader :position

	def initialize(color, position)
		@color = color
		@position = position
	end

end

victory = false

#Undo this later on
#puts "Enter name of player 1:"
#player1 = gets.chomp.to_s
#puts "Enter name of player 2:"
#player2 = gets.chomp.to_s

game = Game.new('player1', 'player2')
game.gameboard.place_pieces
#game.gameboard.show_board
#p game.gameboard.occupied([0,0])
#p game.gameboard.legal_pawn([1,0], [3,0])
#game.gameboard.pawn_moves([1,0], [3,0])
#game.gameboard.show_board
game.gameboard.rotate_board


#new_pawn = Pawn.new('white', 'a2')
#new_pawn.move('a4')
#p new_pawn.position

# Depending on white OR black's turn, may have to change the "view" of the board