class Game
	attr_reader :gameboard

	def initialize
		@gameboard = Board.new
	end

end

class Board

	def initialize
		@board = [['rook','knight','bishop','queen','king','bishop','knight','rook'],
				  ['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
				  ['','','','','','','',''],
				  ['','','','','','','',''],
				  ['','','','','','','',''],
				  ['','','','','','','',''],
				  ['pawn','pawn','pawn','pawn','pawn','pawn','pawn','pawn'],
				  ['rook','knight','bishop','queen','king','bishop','knight','rook']
				]
	end

	def show
		p @board
	end

end

game = Game.new
game.gameboard.show
#p game