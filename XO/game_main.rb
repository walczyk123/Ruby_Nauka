
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

  def pvp
    puts "AAAAA ROZRUBA"
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
end



c = XO.new
c.start

