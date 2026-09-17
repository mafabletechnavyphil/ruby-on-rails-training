class Game
  def initialize
    @x_turn = false
    @game_over = false
    @board = Array.new(9, '-')
  end

  def start
    while !@game_over
      puts "TicTacToe"
      puts @x_turn ? "X's turn" : "O's Turn"
      render_board
      accept_input
      check_win
    end
  end

  private

  def render_board
    @board.each_slice(3) do |row|
      puts row.join(" ")
    end
  end

  def accept_input
    print "Choose which box to put (1-9): "
    choice = gets.chomp.to_i

    while choice <= 0 || choice > 9 || @board[choice - 1] != "-"
      print "Choose which box to put (1-9): "
      choice = gets.chomp.to_i
    end

    modify_board(choice)
    switch_turn
  end

  def modify_board(input)
    @board[input - 1] = @x_turn ? "x" : "o"
  end

  def switch_turn
    @x_turn = !@x_turn
  end

  def check_win
    win_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    win_combinations.each do |combi|
      first = combi.first
      last = combi.last
      if @board[first] != "-" && @board[first] == @board[combi[-2]] && @board[first] == @board[last]
        @game_over = true
        display_winner
      end
    end
  end

  def display_winner
    if @game_over
      puts "Game Over"
      puts @x_turn ? "O Wins" : "X Wins"
      render_board
    end
  end
end

game = Game.new
game.start
