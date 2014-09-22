def set_board(x, y)
	board = []
	for i in 1..(x - 1)
		row = []
		for j in 1..(y - 1)
      row.push("")
		end
		print row
		puts ""
		board.push(row)
	end

	# print board
	return board
end

def set_coins(board, *args)
	args.each do |x, y, points|
    board[(y-1)][(x-1)] = ["c", points]
	end
end

def move(direction)
  if direction == "up"
  	[0, -1]
  elsif direction == "down"
    [0, 1]
  elsif direction == "left"
  	[-1, 0]
  elsif direction == "right"
  	[1, 0]
  elsif direction == "up-right"
  	[1, -1]
  elsif direction == "up-left"
  	[-1, -1]
  elsif direction == "down-right"
    [1, 1]
  elsif direction == "down-left"
  	[-1, 1]
  end
end

def check_break_boundary(board, starting_spot, move)
  # check if it breaks left boundary
  if (starting_spot[0] + move[0]) < 0
  	puts "BOUNDARY BROKEN LEFT"
  # check if it breaks right boundary
  elsif (starting_spot[0] + move[0]) >= (board[0]-1)
  	puts "BOUNDARY BROKEN RIGHT"
  # check if it breaks upper boundary
  elsif (starting_spot[1] + move[1]) < 0
  	puts "BOUNDARY BROKEN UP"
  # check if it breaks bottom boundary
  elsif (starting_spot[1] + move[1]) >= (board[1]-1)
  	puts "BOUNDARY BROKEN BOTTOM"
  else
  	puts "NOT BROKEN"
  	return false
  end
  true
end

board_dim = [6,6]

gameboard = set_board(board_dim[0], board_dim[1])
set_coins(gameboard, [2, 2, 5], [2, 4, 1], [1, 4, 7], [2, 3, 8])

print gameboard

movement = move("up")

ip = [3, 4]

puts ""

puts check_break_boundary(board_dim, ip, movement)

# Tests

def test_board
	test1 = (set_board(3,3) == [["", ""],["", ""]])
	puts "Test for board: #{test1}"
	test2 = (set_board(5,5) == [["","","",""], ["","","",""], ["","","",""], ["","","",""]])
	puts "Test for board2: #{test2}"
end

def test_coins
	board = set_board(3,3)
	set_coins(board, [0,0,3], [1,2,1])

	puts "==="
	print board
	puts "==="

	test1 = board[0][0] == ["c", 3]
	puts "Test1 is #{test1}"
	test2 = board[1][2] == ["c", 1]
	puts "Test2 is #{test2}"
end

test_board
test_coins






