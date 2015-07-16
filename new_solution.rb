require './solver'
class Solution
	def new_solution
		combine(blank_spot_detector(puzzle))
	end
end