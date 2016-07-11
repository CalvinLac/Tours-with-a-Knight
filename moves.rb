Moves = Struct.new(:x, :y, :depth, :children, :parent)

class MovesTree 

	attr_accessor :depth, :max_depth, :start_point, :moves_array, :x, :y

	def initialize(coordinates, max_depth)
		@max_depth = max_depth
		@start_point = Moves.new(coordinates[0], coordinates[1], 0, [], nil)
		available_moves(@start_point)
	end

	def available_moves(moves_node)
		max_depth = @max_depth
		currentdepth= moves_node.depth
		x= moves_node.x 
		y= moves_node.y
		currentdepth +=1
		all_possible_moves = moves_possible(x,y)
		all_possible_moves.each do |move|
			child_move = Moves.new(move[0],move[1], currentdepth, [], moves_node)
			moves_node.children << child_move
			available_moves(child_move) if child_move.depth < max_depth
		end
	end



	def moves_possible(current_x, current_y)
		final_coordinate = []

		#for moving two spaces right and up or down
		x1 = current_x+2
		final_coordinate.push [x1, current_y+1] if x1 >= 0 && (current_y+1) >= 0
		final_coordinate.push [x1, current_y-1] if x1 >= 0 && (current_y-1) >= 0

		#for moving two spaces left and up or down
		x2 = current_x-2
		final_coordinate.push [x1, current_y+1] if x1 >= 0 && (current_y+1) >= 0
		final_coordinate.push [x1, current_y-1] if x1 >= 0 && (current_y-1) >= 0

		#for moving two spaces down and left or right
		y1 = current_y+2
		final_coordinate.push [current_x+1, y1] if current_x+1 >= 0 && y1 >= 0
		final_coordinate.push [current_x-1, y1] if current_x-1 >= 0 && y1 >= 0

		#for moving two spaces up and left or right
		y1 = current_y-2
		final_coordinate.push [current_x+1, y1] if current_x+1 >= 0 && y1 >= 0
		final_coordinate.push [current_x-1, y1] if current_x-1 >= 0 && y1 >= 0

		return final_coordinate
	end




		# 	puts "#{moves_pusher.x} and #{moves_pusher.y}"
		# end
		# @moves_array.each do |next_move|
		# available_moves(next_move) if next_move.depth < max_depth
		# end
		# @moves_array
		# puts @moves_array




end

# m = MovesTree.new([1,1], 2)