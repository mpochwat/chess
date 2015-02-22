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
		@pieces = [Pawn.new('w', 'a2'), Pawn.new('w', 'b2'), Pawn.new('w', 'c2'), Pawn.new('w', 'd2'), 
				     Pawn.new('w', 'e2'), Pawn.new('w', 'f2'), Pawn.new('w', 'g2'), Pawn.new('w', 'h2'),
					 Rook.new('w', 'a1'), Knight.new('w', 'b1'), Bishop.new('w', 'c1'), Queen.new('w', 'd1'),
					 King.new('w', 'e1'), Bishop.new('w', 'f1'), Knight.new('w', 'g1'), Rook.new('w', 'h1'),
					 Pawn.new('b', 'a7'), Pawn.new('b', 'b7'), Pawn.new('b', 'c7'), Pawn.new('b', 'd7'), 
				     Pawn.new('b', 'e7'), Pawn.new('b', 'f7'), Pawn.new('b', 'g7'), Pawn.new('b', 'h7'),
					 Rook.new('b', 'a8'), Knight.new('b', 'b8'), Bishop.new('b', 'c8'), King.new('b', 'd8'),
					 Queen.new('b', 'e8'), Bishop.new('b', 'f8'), Knight.new('b', 'g8'), Rook.new('b', 'h8')]		
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
					if square.show_position == piece.show_position
						square.occupant_new(piece)
					end
				end
			end
		end
	end

end

class Square

	def initialize(position)
		@position = position
		@occupant = nil
	end

	def show_position
		@position
	end

	def show
		@occupant == nil ? (print @position) : (print @occupant)
	end

	def occupant_new(piece)
		@occupant = piece
	end

end

class Pawn

	def initialize(color, position)
		@color = color
		@position = position
	end

	def show_position
		@position
	end	

end

class Rook

	def initialize(color, position)
		@color = color
		@position = position
	end

	def show_position
		@position
	end	

end

class Knight

	def initialize(color, position)
		@color = color
		@position = position
	end

	def show_position
		@position
	end	

end

class Bishop

	def initialize(color, position)
		@color = color
		@position = position
	end

	def show_position
		@position
	end	

end

class Queen

	def initialize(color, position)
		@color = color
		@position = position
	end

	def show_position
		@position
	end

end

class King

	def initialize(color, position)
		@color = color
		@position = position
	end

	def show_position
		@position
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