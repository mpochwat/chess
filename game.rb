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
		#@board = [[Square.new('a8'),Square.new('b8'),Square.new('c8'),Square.new('d8'),Square.new('e8'),Square.new('f8'),Square.new('g8'),Square.new('h8')],
		#		  [Square.new('a7'),Square.new('b7'),Square.new('c7'),Square.new('d7'),Square.new('e7'),Square.new('f7'),Square.new('g7'),Square.new('h7')],
		#		  [Square.new('a6'),Square.new('b6'),Square.new('c6'),Square.new('d6'),Square.new('e6'),Square.new('f6'),Square.new('g6'),Square.new('h6')],
		#		  [Square.new('a5'),Square.new('b5'),Square.new('c5'),Square.new('d5'),Square.new('e5'),Square.new('f5'),Square.new('g5'),Square.new('h5')],
		#		  [Square.new('a4'),Square.new('b4'),Square.new('c4'),Square.new('d4'),Square.new('e4'),Square.new('f4'),Square.new('g4'),Square.new('h4')],
		#		  [Square.new('a3'),Square.new('b3'),Square.new('c3'),Square.new('d3'),Square.new('e3'),Square.new('f3'),Square.new('g3'),Square.new('h3')],
		#		  [Square.new('a2'),Square.new('b2'),Square.new('c2'),Square.new('d2'),Square.new('e2'),Square.new('f2'),Square.new('g2'),Square.new('h2')],
		#		  [Square.new('a1'),Square.new('b1'),Square.new('c1'),Square.new('d1'),Square.new('e1'),Square.new('f1'),Square.new('g1'),Square.new('h1')],
		#		]
		@pieces = [Piece.new('pawn','w', [1,0]), Piece.new('pawn','w', [1,1]), Piece.new('pawn','w', [1,2]), Piece.new('pawn','w', [1,3]), 
				   Piece.new('pawn','w', [1,4]), Piece.new('pawn','w', [1,5]), Piece.new('pawn','w', [1,6]), Piece.new('pawn','w', [1,7]),
				   Piece.new('rook','w', [0,0]), Piece.new('knight','w', [0,1]), Piece.new('bishop','w', [0,2]), Piece.new('queen','w', [0,3]),
				   Piece.new('king','w', [0,4]), Piece.new('bishop','w', [0,5]), Piece.new('knight','w', [0,6]), Piece.new('rook','w', [0,7]),
			  	   Piece.new('pawn','b', [6,0]), Piece.new('pawn','b', [6,1]), Piece.new('pawn','b', [6,2]), Piece.new('pawn','b', [6,3]), 
				   Piece.new('pawn','b', [6,4]), Piece.new('pawn','b', [6,5]), Piece.new('pawn','b', [6,6]), Piece.new('pawn','b', [6,7]),
				   Piece.new('rook','b', [7,0]), Piece.new('knight','b', [7,1]), Piece.new('bishop','b', [7,2]), Piece.new('king','b', [7,3]),
				   Piece.new('queen','b', [7,4]), Piece.new('bishop','b', [7,5]), Piece.new('knight','b', [7,6]), Piece.new('rook','b', [7,7])]		
	end

#	def show_row(row)
#		for i in 0..7
#			row[i].show
#			print " "
#		end
#		' '
#	end

	def show_board
		p @board.values
	end

	def place_pieces
		@pieces.each do |piece|
			@board[piece.type.position] = piece.type
		end
	end

	def occupied(pos)
		if square.occupied.nil?
			end
	end	

end

#class Square
#	attr_reader :position, :occupied

#	def initialize(position)
#		@position = position
#		@occupied = nil
#	end

#	def occupied_new(piece)
#		@occupied = piece
#	end

#	def show
#		@occupied == nil ? (print @position) : (print @occupied)
#	end	

#end

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

	def position_legal(pos)
		if @position[1] == "2"
			if pos[0] == @position[0] && ( pos[1].to_i == (@position[1].to_i + 1) ) || ( pos[1].to_i == (@position[1].to_i + 2) )
				true
			else
				false
			end
		else
			if pos[0] == @position[0] && pos[1].to_i == (@position[1].to_i + 1)
				true
			else
				false
			end
		end
	end

	def move(pos)
		if position_legal(pos)
			@position = pos
		end
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
game.gameboard.show_board

new_pawn = Pawn.new('white', 'a2')
new_pawn.move('a4')
p new_pawn.position

# Depending on white OR black's turn, may have to change the "view" of the board