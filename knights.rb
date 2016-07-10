require_relative 'moves'


#Assuming that the starting point is always going to be at 0,0
class Knights

	attr_accessor :knight_moves

	def initialize(knight_moves)
		@knight_moves = knight_moves
	end

	def bfs (xcoord, ycoord)
		searcher(xcoord, ycoord)
	end

	def searcher(xcoord, ycoord)
		branch = []
		queue = [[@knight_moves.moves_array]]
		puts queue
		

   #   until [queue.x, queue.y] == [xcoord,ycoord]
   #    branch.push queue.children
   # end
   # puts "#{end_coord} #{searching_through.depth}"


	end




end



new_move_tree = MovesTree.new([1,1], 2)
k = Knights.new(new_move_tree)
k.bfs(3,3)