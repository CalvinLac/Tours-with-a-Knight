require_relative 'moves'


#Assuming that the starting point is always going to be at 0,0
class Knights

	attr_accessor :knight_moves

	def initialize(knight_moves)
		@knight_moves = knight_moves
	end

	def bfs (end_coord)
		searcher(end_coord)
	end

	def searcher(end_coord)
		branch = []
		starting_position = @knight_moves.start_point

     until [starting_position.x, starting_position.y] == end_coord
      branch += searching_through.children
       searching_through = yield(branch)
   end
   puts "#{end_coord} #{searching_through.depth}"


	end




end



new_move_tree = MovesTree.new([1,1], 5)
k = Knights.new(new_move_tree)
k.bfs([3,3])