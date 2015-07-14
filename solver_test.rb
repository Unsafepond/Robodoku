require 'minitest/autorun'
require 'minitest/pride'
require_relative 'solver'

class TestSolver < Minitest::Test
	def test_solver_gets_rows
		puzzle = 
"8  5 4  7
  5 3 9  
 9 7 1 6 
1 3   2 8
 4     5 
2 78136 4
 3 9 2 8 
  2 7 5  
6  3 5  1"
	solver = Solver.new
		assert_equal "8  5 4  7", solver.rows(puzzle).first
	end
	def test_solver_gets_colunms
		puzzle =
"8  5 4  7
  5 3 9  
 9 7 1 6 
1 3   2 8
 4     5 
2 78136 4
 3 9 2 8 
  2 7 5  
6  3 5  1"
	solver = Solver.new
	assert_equal "8  1 2  6", solver.colunms(puzzle).first
	end
	def test_solver_gets_squares
		puzzle =
"8  5 4  7
  5 3 9  
 9 7 1 6 
1 3   2 8
 4     5 
2 78136 4
 3 9 2 8 
  2 7 5  
6  3 5  1"
	solver = Solver.new
	assert_equal ["8  ", "  5", " 9 "], solver.squares(puzzle).first
	end
	def test_spots_get_filled
		puzzle =
"8  5 4  7
  5 3 9  
 9 7 1 6 
1 3   2 8
 4     5 
2 78136 4
 3 9 2 8 
  2 7 5  
6  3 5  1"
	solver = Solver.new
	assert_equal false, solver.blank_spot_detector(puzzle).first.include?(" ")
	end
end