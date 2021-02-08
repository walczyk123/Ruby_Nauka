class XO
  def start
    say_hello
    set_game_mode if STDIN.gets.chomp == "y"
    board = Matrix.build(3) { " " }
    pvp(board) if set_game_mode == '1'
    pve(board) if set_game_mode == '2'
    eve(board) if set_game_mode == '3'
    zjebales_gre
  end

  def say_hello
    puts "Welcome Adventurer"
    sleep 0.5
    puts "Do you want to play a game? [y / n]"
  end

  def set_game_mode
    puts "Excelent"
    sleep 0.5
    puts "Pick game mode:"
    sleep 0.5
    puts "1. PVP \n2. PVE \n3. EVE"
    STDIN.gets.chomp
  end

  def pvp(board)
    puts "Let's fight"
    p1 = PLAYER.new(1, "x", board)
    p2 = PLAYER.new(2, "o", board)
    until check
      # zrobic wyswietlanie na osobnej klasie
      #board
      p1.play_turn
      #board
      p2.play_turn
    end
  end

  def pve(board)
    puts "wiec wybrales smierc, rozERWE CIE NA KAWałki"
  end

  def eve(board)
    puts "I rzekl mędrzec do kutasów - walczcie, kto wygra, czeka go nagroda"
  end

  def zjebales_gre
    puts "miales tylko jedno robote"
  end

  def check
    false
  end

end

class PLAYER
  def initialize(id, sign, board)
    @pl_id = id
    @pl_sign = sign
    @board = board
  end

  def play_turn
    show
    insert(sign)
  end

  def show
    puts "Your turn Player #{@pl_id}, type x,y: "
    puts "   │ 1 │ 2 │ 3 │"
    puts "───┼───┼───┼───┤"
    puts " 1 │ #{@board[0, 0]} │ #{@board[0, 1]} │ #{@board[0, 2]} │"
    puts "───┼───┼───┼───┤"
    puts " 2 │ #{@board[1, 0]} │ #{@board[1, 1]} │ #{@board[1, 2]} │"
    puts "───┼───┼───┼───┤"
    puts " 3 │ #{@board[2, 0]} │ #{@board[2, 1]} │ #{@board[2, 2]} │"
  end

  def insert(sign)
    while true
      place = gets.chomp
      cords = place.split(",")
      puts "X: #{Integer(cords[0])}, Y: #{cords[1]}"
      (cords_int = good?(cords)) ? (@board[cords_int[0], cords_int[1]] = sign) : false
    end
  end

  def good?(cords)
    return puts "wrong char!"  unless num?(cords[0]) && num?(cords[1])
    return puts "number is out of boundary!"  unless good_num?(cords[0]) && good_num?(cords[1])
    cords_int = cords.map(&:to_i)
    return puts "spot has been already taken!"  unless empty?(cords_int)
    cords_int
  end

  def num?(str)
    !!Integer(str)
    rescue ArgumentError, TypeError
    false
  end

  def good_num?(str)
    [0, 1, 2].include?(Integer(str))
  end

  def empty?(cords_int)
    x = cords_int[0]
    y = cords_int[1]
    true if @board[x, y] == " "
  end
end

require 'matrix'
c = XO.new
c.start

