class XO
  def start
    say_hello
    game_mode if STDIN.gets.chomp == "y"
    gam_mod = STDIN.gets.chomp
    pvp if gam_mod == '1'
    pve if gam_mod == '2'
    eve if gam_mod == '3'
    stupid_error
  end

  def say_hello
    puts "Welcome Adventurer"
    sleep 0.5
    puts "Do you want to play a game? [y / n]"
  end

  def game_mode
    puts "Excelent"
    sleep 0.5
    puts "Pick game mode:"
    sleep 0.5
    puts "1. PVP \n2. PVE \n3. EVE"
  end

  def pvp
    puts "Let's fight"
    b1 = BOARD.new(3)
    b1.generate
    p1 = PLAYER.new(1, "x", b1)
    p2 = PLAYER.new(2, "o", b1)
    until check
      b1.show
      p1.play_turn
      b1.show
      p2.play_turn
    end
  end

  def pve
    puts "wiec wybrales smierc, rozERWE CIE NA KAWałki"
  end

  def eve
    puts "I rzekl mędrzec do kutasów - walczcie, kto wygra, czeka go nagroda"
  end

  def stupid_error
    puts "miales tylko jedno robote"
  end

  def check
    false
  end

end

class PLAYER
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

class BOARD
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

  def header
    print "   │"
    (1..(@size)).each do |a|
      print " " + (a-1).to_s + " │"
    end
    print("\n")
  end

  def contour
    (1..@size + 1).each do
      print "───┼"
      end
    print("\n")
  end

  def horizontal(row)
     print " #{row-1} │"
    (1..@size).each do |a|
      print " " + @board[a-1, row-1].to_s+ " │"
    end
    print("\n")
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


# puts "   │ 1 │ 2 │ 3 │"
#puts "───┼───┼───┼───┤"
#puts " 1 │ #{@board[0, 0]} │ #{@board[0, 1]} │ #{@board[0, 2]} │"
#puts "───┼───┼───┼───┤"
#puts " 2 │ #{@board[1, 0]} │ #{@board[1, 1]} │ #{@board[1, 2]} │"
#puts "───┼───┼───┼───┤"
#puts " 3 │ #{@board[2, 0]} │ #{@board[2, 1]} │ #{@board[2, 2]} │"