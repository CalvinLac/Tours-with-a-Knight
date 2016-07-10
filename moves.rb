Moves = Struct.new(:x, :y, :depth, :children, :parent)

class MovesTree 

	def initialize(coordinates, max_depth)
		@max_depth = max_depth
		@exact_point = Moves.new(coordinates[0], coordinates[1], [], nil)
		available_moves(@exact_point)
	end

	def available_moves(moves_node)
		x= moves_node.x 
		y= moves_node.y
		depth= moves_node.depth
		moves_array = []
		all_possible_moves = moves_possible(x,y)
		all_possible_moves.each do |move|
			moves_array.push Moves.new(move[0],move[1], depth, moves_node)
		end
		puts moves_array	
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











end

m = MovesTree.new([1,1], 1)