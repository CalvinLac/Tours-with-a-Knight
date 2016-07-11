require_relative 'moves'
require_relative 'queue'


#Assuming that the starting point is always going to be at 0,0
class Knights

	attr_accessor :knight_moves

	def initialize(tree)
		@tree = tree
		@knight = tree.start_point 
		@node_queue = Queue.new
		@dfs_array = []
	end

	def bfs (xcoord, ycoord)
		@node_queue.enqueue @knight

		while !@node_queue.empty?
			checker = @node_queue.dequeue
			if [checker.x, checker.y] ==[xcoord, ycoord]
				puts "You have found the sequence #{checker.depth} moves in using bfs"
				return checker
			else
				checker.children.each do |child_of_child|
					@node_queue.enqueue child_of_child
				end
			end
		end
		if @node_queue.empty?
			puts "It is impossible to get from #{@knight.x},#{@knight.y} to #{xcoord},#{ycoord} in #{@tree.max_depth} moves"
		end
	end

	def dfs (xcoord, ycoord)
		checker_for_dfs = []
		checker_for_dfs << @knight

		while !checker_for_dfs.empty?
			checker = checker_for_dfs.pop 
			if [checker.x, checker.y] ==[xcoord, ycoord]
				puts "You have found the sequence #{checker.depth} moves in using dfs"
				return checker
			else
				checker.children.each do |child_of_child|
					checker_for_dfs << child_of_child
				end
			end
		end
		if checker_for_dfs.empty?
			puts "It is impossible to get from #{@knight.x},#{@knight.y} to #{xcoord},#{ycoord} in #{@tree.max_depth} moves"
		end
	end





end



new_move_tree = MovesTree.new([0,0], 4)
k = Knights.new(new_move_tree)
k.bfs(2,4)
k.dfs(2,4)
k.bfs(8,8)
k.dfs(8,8)