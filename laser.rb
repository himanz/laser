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

def check_break_boundary_corners(board, starting_spot, direction)
  max_y = board.length
  print "WOO"
  puts max_y
  # check top left corner
  if (starting_spot[0] == 1 && starting_spot[1] == 1) && (direction == "up-left")
    return [[1,1], "down-right"]
  # check bottom left corner
  elsif (starting_spot[0] == 1 && starting_spot[1] == max_y) && (direction == "down-left")
    return [[1, -1], "up-right"]
  end
end

def check_break_boundary(board_grid, starting_spot, direction)
  board_x = board_grid[0] - 1
  board_y = board_grid[1] - 1

  max_y = board_x - 1
  max_x = board_y - 1
  
  moving = move(direction)
  start_x = starting_spot[0] 
  start_y = starting_spot[1]
  next_x = moving[0]
  next_y = moving[1]

  # check if it breaks left boundary
  if (start_x + next_x) < 1
  	puts "BOUNDARY BROKEN LEFT"
  # check if it breaks right boundary
  elsif (start_x + next_x) > board_x 
  	puts "BOUNDARY BROKEN RIGHT"
  # check if it breaks upper boundary
  elsif (start_y + next_y) < 1
  	puts "BOUNDARY BROKEN UP"
  # check if it breaks bottom boundary
  elsif (start_y + next_y) > board_y
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

ip = [3, 4]

puts ""

# Tests

def test_board
	test1 = (set_board(3,3) == [["", ""],["", ""]])
	puts "Test for board: #{test1}"
	test2 = (set_board(5,5) == [["","","",""], ["","","",""], ["","","",""], ["","","",""]])
	puts "Test for board2: #{test2}"
end

def test_coins
	board = set_board(6,6)
	set_coins(board, [2,2,5], [1,4,7])

	puts "==="
	print board
	puts "==="

	test1 = board[1][1] == ["c", 5]
	puts "Test1 is #{test1}"
	test2 = board[3][0] == ["c", 7]
	puts "Test2 is #{test2}"
end

def test_boundaries
  test_left = check_break_boundary([6,6], [1,1], "left")
  puts "check break boundary left at [1,1] should return true: #{test_left}"
  test_left_wrong = check_break_boundary([6,6], [2,1], "left")
  puts "check break boundary left at [2,1] should return false: #{test_left_wrong}"
  test_right = check_break_boundary([6,6], [5,1], "right")
  puts "check break boundary right at [5,1] should return true: #{test_right}"
  test_right_wrong = check_break_boundary([6,6], [4,1], "right")
  puts "check break boundary right at [4,1] should return false: #{test_right_wrong}"
  test_up = check_break_boundary([6,6], [1,1], "up")
  puts "check break boundary up at [1,1] should return true: #{test_up}"
  test_up_wrong = check_break_boundary([6,6], [1,2], "up")
  puts "check break boundary up at [1,2] should return false: #{test_up_wrong}"
  test_down = check_break_boundary([6,6], [5,5], "down")
  puts "check break boundary up at [5,5] should return true: #{test_down}"
  test_down_wrong = check_break_boundary([6,6], [5,4], "down")
  puts "check break boundary up at [5,5] should return false: #{test_down_wrong}"
end

def test_corner_break
  board = set_board(6,6)
  puts ""
  test_up_left = (check_break_boundary_corners(board, [1,1], "up-left") == [[1,1], "down-right"])
  puts "check_break_boundary_corners up-left at [0,0] should return [[1,1], 'down-right': #{test_up_left}" 
  test_down_left = (check_break_boundary_corners(board, [1,5], "down-left") == [[1,-1], "up-right"])
  puts "==="
  print test_down_left
  puts "==="
  puts "check_break_boundary_corners bottom-left at [0,0] should return [[1,-1], 'up-right': #{test_down_left}" 
end

puts "ppp"
print gameboard
puts "ppp"

test_board
test_coins
test_corner_break
test_boundaries





