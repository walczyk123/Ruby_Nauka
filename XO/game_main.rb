class CrossCirlce
  def start
    say_hello
    game_mode if STDIN.gets.chomp == "y"
    gam_mod = STDIN.gets.chomp
    case gam_mod
    when "1"
      game(1)
    when "2"
      game(2)
    when "3"
      game(3)
    else
      stupid_error
    end
  end

  private def say_hello
    puts "Welcome Adventurer"
    sleep 0.5
    puts "Do you want to play a game? [y / n]"
  end

  private def game_mode
    puts "Excellent"
    sleep 0.5
    puts "Pick game mode:"
    sleep 0.5
    puts "1. Player vs Player \n2. Player vs Bot \n3. Bot vs Bot"
  end

  private def game(mode)
    puts "Let's fight"
    b1 = Board.new(3)
    b1.generate
    case mode
    when 1
      p1 = Player.new(1, "x", b1)
      p2 = Player.new(2, "o", b1)
    when 2
      p1 = Player.new(1, "x", b1)
      p2 = Bot.new(2, "o", b1)
    when 3
      p1 = Bot.new(1, "x", b1)
      p2 = Bot.new(2, "o", b1)
    else
      puts "something went wrong"
    end
    #przekazywac znak a nie na pałe
    over = false
    which = 0
    until over
      b1.show
      p1.play_turn
      if b1.check("x")
        over = true
        which = 1
      end
      b1.show
      p2.play_turn
      if b1.check("o")
        over = true
        which = 2
      end
      if b1.spot?
        over = true
      end
    end
    b1.show
    # puts "Player#{p1} won a game!" if a
    puts "Player#{which} won a game!" if (over && (which == 1 || which == 2))
    puts "And its over, nobody wins :/" if (over && which == 0)
  end

  private def stupid_error
    puts "why did you do that?"
  end
end

class Player
  def initialize(id, sign, arena)
    @pl_id = id
    @pl_sign = sign
    @global_board= arena
  end

  def play_turn
    puts "Your turn Player #{@pl_id}, type x,y: "
    @global_board.insert(@pl_sign)
  end
end

class Bot
  def initialize(id, sign, arena)
    @pl_id = id
    @pl_sign = sign
    @global_board= arena
  end

  def play_turn
    puts "Now its bot's turn #{@pl_id}, wait for his move"
    @global_board.bot_insert(@pl_sign)
  end
end

class Board
  WAIT=0.7
  def initialize(size)
    @size=size
  end

  def generate
    @board = Matrix.build(@size) { " " }
  end

  def show
    header
    (1..(@size)).each do |a|
      contour
      horizontal(a)
    end
  end

  def bot_insert(sign)
    cords_int=Array.new(2)
    (1..cords_int.length+1).each do |a|
      cords_int[a-1] = rand(3)
    end
    sleep(WAIT)
    puts "Bot#{@pl_id} put his mark on X: #{(cords_int[0])}, Y: #{cords_int[1]}"
    if empty?(cords_int)
      @board[cords_int[0], cords_int[1]] = sign
      true
    else
      puts "spot has been already taken!"
      false
    end
    sleep(WAIT)
  end

  def insert(sign)
    #while true
    place = gets.chomp
    cords = place.split(",")
    puts "X: #{Integer(cords[0])}, Y: #{cords[1]}"
    cords_int = cords.map(&:to_i)
    if good?(cords)
      (@board[cords_int[0], cords_int[1]] = sign)
      true
    else
      false
    end
    #cos nie tak z tym zapisem, jezeli jest dobry to chce non stop wpisywac
    #(cords_int = good?(cords)) ? (@board[cords_int[0], cords_int[1]] = sign) : false
    #end
  end

  def check(sign)
    #troche na pałe sprawdzanie, tu musze jakos bardziej zautomatyzowac
    # poki co jest zarys, mocno naciagnayo
    (1..(@size)).each do |r|
       return true if @board[r-1, 0] == sign && @board[r-1, 1] == sign && @board[r-1, 2] == sign
    end
    (1..(@size)).each do |c|
        return true if @board[0, c-1] == sign && @board[1, c-1] == sign && @board[2, c-1] == sign
    end
    return true if @board[0, 0] == sign && @board[1, 1] == sign && @board[2, 2] == sign
    return true if @board[0, 2] == sign && @board[1, 1] == sign && @board[2, 0] == sign
    false
  end
  def spot?
    (1..(@size)).each do |r|
      (1..(@size)).each do |c|
        return false if @board[r-1, c-1] == " "
      end
    end
    true
  end

  private def good?(cords)
    return puts "wrong char!"  unless num?(cords[0]) && num?(cords[1])
    return puts "number is out of boundary!"  unless good_num?(cords[0]) && good_num?(cords[1])
    cords_int = cords.map(&:to_i)
    return puts "spot has been already taken!"  unless empty?(cords_int)
    cords_int
  end

  private def header
    print "   │"
    (1..(@size)).each do |a|
      print " " + (a-1).to_s + " │"
    end
    print("\n")
  end

  private def contour
    (1..@size + 1).each do
      print "───┼"
    end
    print("\n")
  end

  private def horizontal(row)
    print " #{row-1} │"
    (1..@size).each do |a|
      print " " + @board[a-1, row-1].to_s+ " │"
    end
    print("\n")
  end

  private def num?(str)
    !!Integer(str)
    rescue ArgumentError, TypeError
    false
  end

  private def good_num?(str)
    [0, 1, 2].include?(Integer(str))
  end

  private def empty?(cords_int)
    x = cords_int[0]
    y = cords_int[1]
    true if @board[x, y] == " "
  end

end

require 'matrix'
c = CrossCirlce.new
c.start
