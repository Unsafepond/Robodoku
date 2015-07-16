require 'pry'
class Solver
	attr_accessor :puzzle, :squares, :rows, :colunms
	def initialize(puzzle)
		@puzzle = puzzle
		@squares = squares(puzzle)
		@rows = rows(puzzle)
		@colunms = colunms(puzzle)
	end
	def rows(puzzle = puzzle)
		puzzle.split("\n")
	end
	def colunms(puzzle = puzzle)
		colunms = ["", "", "", "", "", "", "", "", ""]
		rows(puzzle).each do |row|
			colunms.each_with_index do |i, index|
				colunms[index] << row[index]
			end
		end
		return colunms
	end
	def squares(puzzle = puzzle)
		squares_list = [[], [], [], [], [], [], [], [], []]
		rows = rows(puzzle)
		rows[0..2].each do |row| 
			squares_list[0] << row[0..2]
			squares_list[1] << row[3..5]
			squares_list[2] << row[6..8]
		end
		rows[3..5].each do |row|
			squares_list[3] << row[0..2]
			squares_list[4] << row[3..5]
			squares_list[5] << row[6..8]
		end
		rows[6..8].each do |row|
			squares_list[6] << row[0..2]
			squares_list[7] << row[3..5]
			squares_list[8] << row[6..8]
		end
		return squares_list.map { |square| square.join}
	end
	def spot_filler(row)
		until row.include?(" ") == false 
			row.sub!(" ", Random.rand(10).to_s)
		end
		return row
	end
	def blank_spot_detector(puzzle)
		rows(puzzle).map do |row|
			if row.include?(" ")
				spot_filler(row)
			end
		end
	end
	def solved?(puzzle)
		solved = false
    if sum_of(squares) && sum_of(rows) && sum_of(colunms)
    	solved = true
    end
    return solved
	end
	def sum_of(var)
		characters = var.map do |x|
			x.split("")
		end
		numbers = characters.flatten.map do |char|
			if char == " "
				char = 0
			else
				char.to_i
			end
		end
		sum = numbers.inject(:+)

		return sum / 9 == 45
	end
	def solve
		if solved?(puzzle)
			return puzzle
		else
			if solved?(new_solution) == false
				solved?(new_solution)
			else
				return new_solution
			end
		end
	end
	def combine(puzzle_array)
		puzzle_array.join("\n")
	end
	def new_solution
		combine(blank_spot_detector(puzzle))
	end
end