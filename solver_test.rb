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
	solver = Solver.new(puzzle)
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
	solver = Solver.new(puzzle)
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
	solver = Solver.new(puzzle)
	assert_equal "8    5 9 ", solver.squares(puzzle).first
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
	solver = Solver.new(puzzle)
	assert_equal false, solver.blank_spot_detector(puzzle).include?(" ")
	end
	def test_solver_adds_colunms
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
	solver = Solver.new(puzzle)
	colunms = solver.colunms(puzzle)
	assert_equal false, solver.sum_of(colunms)
	end
	def test_solver_adds_rows
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
	solver = Solver.new(puzzle)
	rows = solver.rows(puzzle)
	assert_equal false, solver.sum_of(rows)
	end
	def test_solver_adds_squares
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
	solver = Solver.new(puzzle)
	squares = solver.squares(puzzle)
	assert_equal false, solver.sum_of(squares)
	end
	def test_solver_solves_easy_puzzle
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
solved = 
"826594317
715638942
394721865
163459278
948267153
257813694
531942786
482176539
679385421"
	solver = Solver.new(puzzle)
	assert_equal solved, solver.solve
	end
	def test_it_detects_solved_puzzle
		puzzle = 
"826594317
715638942
394721865
163459278
948267153
257813694
531942786
482176539
679385421"
solved = 
"826594317
715638942
394721865
163459278
948267153
257813694
531942786
482176539
679385421"
	solver = Solver.new(puzzle)
	assert_equal solved, solver.solve
	end
def test_it_solves_trivial_puzzle
		puzzle = 
"8 6594317
715638942
394721865
163459278
948267153
257813694
531942786
482176539
679385421"
solved = 
"826594317
715638942
394721865
163459278
948267153
257813694
531942786
482176539
679385421"
	solver = Solver.new(puzzle)
	assert_equal solved, solver.solve
	end

end

