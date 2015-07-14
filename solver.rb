require 'pry'
class Solver
	def rows(puzzle)
		puzzle.split("\n")
	end
	def colunms(puzzle)
		colunms = ["", "", "", "", "", "", "", "", ""]
		rows(puzzle).each do |row|
			colunms[0] << row[0]
			colunms[1] << row[1]
			colunms[2] << row[2]
			colunms[3] << row[3]
			colunms[4] << row[4]
			colunms[5] << row[5]
			colunms[6] << row[6]
			colunms[7] << row[7]
			colunms[8] << row[8]
		end
		return colunms
	end
end