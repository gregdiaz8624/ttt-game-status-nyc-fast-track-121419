def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board_array)
  board_array.each do |symbol|
    if symbol == " "
      return false 
    end 
  end
end 

def draw?(board_array)  
  if full?(board_array) && !won?(board_array)
    return true
  else 
    return false
  end
  
end

def over?(board_array)
  if won?(board_array) || draw?(board_array)
    return true
  else
    return false
  end
end


def winner(board)
  if won?(board)
    arr_winning_combination = won?(board)
    index = arr_winning_combination[0]
    return board[index]
  else
    return nil
  end
end
