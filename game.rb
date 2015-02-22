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
		@board = [[Square.new('a8'),Square.new('b8'),Square.new('c8'),Square.new('d8'),Square.new('e8'),Square.new('f8'),Square.new('g8'),Square.new('h8')],
				  [Square.new('a7'),Square.new('b7'),Square.new('c7'),Square.new('d7'),Square.new('e7'),Square.new('f7'),Square.new('g7'),Square.new('h7')],
				  [Square.new('a6'),Square.new('b6'),Square.new('c6'),Square.new('d6'),Square.new('e6'),Square.new('f6'),Square.new('g6'),Square.new('h6')],
				  [Square.new('a5'),Square.new('b5'),Square.new('c5'),Square.new('d5'),Square.new('e5'),Square.new('f5'),Square.new('g5'),Square.new('h5')],
				  [Square.new('a4'),Square.new('b4'),Square.new('c4'),Square.new('d4'),Square.new('e4'),Square.new('f4'),Square.new('g4'),Square.new('h4')],
				  [Square.new('a3'),Square.new('b3'),Square.new('c3'),Square.new('d3'),Square.new('e3'),Square.new('f3'),Square.new('g3'),Square.new('h3')],
				  [Square.new('a2'),Square.new('b2'),Square.new('c2'),Square.new('d2'),Square.new('e2'),Square.new('f2'),Square.new('g2'),Square.new('h2')],
				  [Square.new('a1'),Square.new('b1'),Square.new('c1'),Square.new('d1'),Square.new('e1'),Square.new('f1'),Square.new('g1'),Square.new('h1')],
				]
		@pieces = [Piece.new('pawn','w', 'a2'), Piece.new('pawn','w', 'b2'), Piece.new('pawn','w', 'c2'), Piece.new('pawn','w', 'd2'), 
				   Piece.new('pawn','w', 'e2'), Piece.new('pawn','w', 'f2'), Piece.new('pawn','w', 'g2'), Piece.new('pawn','w', 'h2'),
				   Piece.new('rook','w', 'a1'), Piece.new('knight','w', 'b1'), Piece.new('bishop','w', 'c1'), Piece.new('queen','w', 'd1'),
				   Piece.new('king','w', 'e1'), Piece.new('bishop','w', 'f1'), Piece.new('knight','w', 'g1'), Piece.new('rook','w', 'h1'),
			  	   Piece.new('pawn','b', 'a7'), Piece.new('pawn','b', 'b7'), Piece.new('pawn','b', 'c7'), Piece.new('pawn','b', 'd7'), 
				   Piece.new('pawn','b', 'e7'), Piece.new('pawn','b', 'f7'), Piece.new('pawn','b', 'g7'), Piece.new('pawn','b', 'h7'),
				   Piece.new('rook','b', 'a8'), Piece.new('knight','b', 'b8'), Piece.new('bishop','b', 'c8'), Piece.new('king','b', 'd8'),
				   Piece.new('queen','b', 'e8'), Piece.new('bishop','b', 'f8'), Piece.new('knight','b', 'g8'), Piece.new('rook','b', 'h8')]		
	end

	def show_row(row)
		for i in 0..7
			row[i].show
			print " "
		end
		' '
	end

	def show_board
		@board.each do |row|
			p show_row(row)
		end
	end

	def place_pieces
		@pieces.each do |piece|
			@board.each do |row|
				row.each do |square|
					if square.position == piece.type.position
						square.occupant_new(piece.type)
					end
				end
			end
		end
	end

end

class Square
	attr_reader :position

	def initialize(position)
		@position = position
		@occupant = nil
	end

	def occupant_new(piece)
		@occupant = piece
	end

	def show
		@occupant == nil ? (print @position) : (print @occupant)
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