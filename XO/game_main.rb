class XO
  def start
    gamemode = say_hello()
    #puts(gamemode) #tymczasowo to tu wisi do debuggowania
    zjebales_gre() if gamemode == 4 # tez tymczasowe rozwiazanie xd

    pvp() if gamemode == 1
    pve() if gamemode == 2
    eve() if gamemode == 3
  end

  def say_hello
    puts "Welcome Adventurer"
    sleep 0.5
    puts "Do you want to play a game? [y / n]"
    prompt = STDIN.gets.chomp
    return unless prompt == 'y'
    mode = eager()
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
    puts "Let's fight"
    board = Matrix.build(3) { " " }

    until check
      p1 = PLAYER.new(1, "x", board) # pasowalo by symbole, chwilowo nad tym walcze
      p2 = PLAYER.new(2, "o", board)
    end
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
    false
  end

end

class PLAYER
  def initialize(id, sign, board)
    @pl_id = id
    @pl_sign = sign
    @board = board

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
    place = gets.chomp
    cords = place.split(",")
    cords_int = cords.map(&:to_i)
    puts "X: #{Integer(cords[0])}, Y: #{cords[1]}"

    # z jakiegos powodu nie dziala, zapytać!
    # update chyba naprawilem
    # update 2 chyba nie
    #good?(cords,cords_int) ? (return true) : (return false)

    if good?(cords)
      @board[cords_int[0], cords_int[1]] = sign
    else

    end
    puts " w8"
  end

  def good?(cords)
    #tu mi sie nie podobaja ify i trzeba pogadac z Radkiem:
    # 1. za duzo zbyt drobnych moim zdaniem
    # 2. if !true sie jakos zamienialo unless czy tam until (zapytac) update: zrobione przy empty?
    # 3. moze da sie to wyciagnac calkiem w inne miejsce
    if !num?(cords[0]) && !num?(cords[1])
      puts "wrong char!"
      false
    end
    if !good_num?(cords[0]) && !good_num?(cords[1])
      puts "number is out of boundary!"
      false
    end
    cords_int = cords.map(&:to_i)
    unless empty?(cords_int)
      puts "spot has been already taken!"
      false
    end
      true
  end

  def num?(str)
    !!Integer(str)
  rescue ArgumentError, TypeError
    false
  end

  def good_num?(str)
    Integer(str) == 1 || Integer(str) == 2 || Integer(str) == 0
  end

  def empty?(cords)
    x = cords[0]
    y = cords[1]
    true if @board[x, y] == " "
  end
end

require 'matrix'
c = XO.new
c.start

