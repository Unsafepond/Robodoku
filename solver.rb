require 'pry'
class Solver
	def rows(puzzle)
		puzzle.split("\n")
	end
	def colunms(puzzle)
		colunms = ["", "", "", "", "", "", "", "", ""]
		rows(puzzle).each do |row|
			colunms.each_with_index do |i, index|
				colunms[index] << row[index]
			end
		end
		return colunms
	end
	def squares(puzzle)
		squares = [[], [], [], [], [], [], [], [], []]
		rows = rows(puzzle)
		squares[0] << rows[0][0..2]
		squares[0] << rows[1][0..2]
		squares[0] << rows[2][0..2]

		squares[1] << rows[0][3..5]
		squares[1] << rows[1][3..5]
		squares[1] << rows[2][3..5]

		squares[2] << rows[0][6..8]
		squares[2] << rows[1][6..8]
		squares[2] << rows[2][6..8]

		squares[3] << rows[3][0..2]
		squares[3] << rows[4][0..2]
		squares[3] << rows[5][0..2]

		squares[4] << rows[3][3..5]
		squares[4] << rows[4][3..5]
		squares[4] << rows[5][3..5]

		squares[5] << rows[3][6..8]
		squares[5] << rows[4][6..8]
		squares[5] << rows[5][6..8]

		squares[6] << rows[6][0..2]
		squares[6] << rows[7][0..2]
		squares[6] << rows[8][0..2]

		squares[7] << rows[6][3..5]
		squares[7] << rows[7][3..5]
		squares[7] << rows[8][3..5]

		squares[8] << rows[6][6..8]
		squares[8] << rows[7][6..8]
		squares[8] << rows[8][6..8]
		return squares
	end
	def spot_filler(row)
		until row.include?(" ") == false && solved? 
			row.sub!(" ", Random.rand(10).to_s)
			# binding.pry
		end
	end
	def blank_spot_detector(puzzle)
		filled = [] 
		rows(puzzle).each do |row|
			if row.include?(" ")
				filled << spot_filler(row)
			else
				filled << row
			end
		end
	end
	def solved?
		solved = false
    if sum_of_squares && sum_of_rows && sum_of_colunms
    	solved = true
    end
    return solved
	end
	def sum_of_colunms(colunms)
		characters = colunms.map do |colunm|
			colunm.split("")
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
	def sum_of_rows(rows)
		characters = rows.map do |row|
			row.split("")
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
	def sum_of_squares(squares)
		characters = squares.map do |square|
			square.join.split("")
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
end