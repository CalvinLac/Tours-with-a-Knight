require_relative 'moves'
require_relative 'queue'


#Assuming that the starting point is always going to be at 0,0
class Knights

	attr_accessor :knight_moves

	def initialize(tree)
		@tree = tree
		@knight = tree.start_point 
		@node_queue = Queue.new
	end

	# def bfs (xcoord, ycoord)
	# 	searcher(xcoord, ycoord)
	# end

	# def searcher(xcoord, ycoord)
		
	# 	queue = [@knight]
	# 	puts @knight.children
		
	def bfs(target_coords)
    @node_queue.enqueue(@knight.start_point)
    check_node(@node_queue.dequeue, target_coords)

	end


def check_node(move, target_coords)
  # puts "checking [#{move.x}][#{move.y}] at depth: #{move.depth}"
    if move.x != target_coords[0] || move.y != target_coords[1]
      move.children.each do |child|
        @node_queue.enqueue(child)
      end
      while !@node_queue.empty?
        check_node(@node_queue.dequeue, target_coords)
      end
  end
end




end



new_move_tree = MovesTree.new([1,1], 2)
k = Knights.new(new_move_tree)
k.bfs([3,3])