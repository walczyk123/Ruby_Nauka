
class XO

  def start
    gamemode=say_hello()
    #puts(gamemode) #tymczasowo to tu wisi do debuggowania
    zjebales_gre() if gamemode==4 # tez tymczasowe rozwiazanie xd

    pvp() if gamemode==1
    pve() if gamemode==2
    eve() if gamemode==3

  end

  def say_hello
    puts "Welcome Adventurer"
    sleep 0.5
    puts "Do you want to play a game? [y / n]"
    prompt = STDIN.gets.chomp
    return unless prompt == 'y'
    mode=eager()
    #unless prompt == 'n' ? return zjebales_gre() , mode=eager() end
  end

  def eager
    puts "Excelent"
    sleep 0.5
    puts "Pick game mode:"
    sleep 0.5
    puts "1. PVP \n2. PVE \n3. EVE"
    prompt = STDIN.gets.chomp
    return 1 if prompt == '1'
    return 2 if prompt == '2'
    return 3 if prompt == '3'
    return 4
  end

  def pvp()
    puts "AAAAA ROZRUBA"

    # puts board.at(1)
    board=Matrix.build(3) { " " }
    p1 = PLAYER.new(1,:x,board)
    p2 = PLAYER.new(2,:o,board)
  end
  def pve
    puts "wiec wybrales smierc, rozERWE CIE NA KAWałki"
  end
  def eve
    puts "I rzekl mędrzec do kutasów - walczcie, kto wygra, czeka go nagroda"
  end
  def zjebales_gre
    puts "miales tylko jedno robote"
  end



  def check
    return false
  end

end

class PLAYER
  def initialize(id,sign,board)
    @pl_id = id
    @pl_sign = sign
    @board = board

    show
    ins=insert

    puts "wrong char!" if ins == 0
    puts "number is out of boundary!" if ins == 1
    puts "spot has been already taken!" if ins == 2
  end

  def show
    puts "Your turn Player #{@pl_id}, type x,y: "
    puts "   │ 1 │ 2 │ 3 │"
    puts "───┼───┼───┼───┤"
    puts " 1 │ #{@board[0,0]} │ #{@board[0,1]} │ #{@board[0,2]} │"
    puts "───┼───┼───┼───┤"
    puts " 2 │ #{@board[1,0]} │ #{@board[1,1]} │ #{@board[1,2]} │"
    puts "───┼───┼───┼───┤"
    puts " 3 │ #{@board[2,0]} │ #{@board[2,1]} │ #{@board[2,2]} │"
  end
  def insert
    place = gets.chomp
    cords = place.split(",")
    puts "X: #{cords[0]}, Y: #{cords[1]}"
    return 0 until num?(cords[0]) && num?(cords[1])
    return 1 until good_num?(cords[0]) && good_num?(cords[1])
    # return 2 until empty?(cords)
  end

  def num?(str)
    !!Integer(str)
  rescue ArgumentError, TypeError
    false
  end

  def good_num?(str)
    Integer(str) == 1 || Integer(str) == 2 || Integer(str) == 3
  end

  def empty?(cords)
    x=cords[0]
    y=cords[1]
    true if @board[x,y].include?(:x)
  end


end

require 'matrix'
c = XO.new
c.start

