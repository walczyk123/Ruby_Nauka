class Player 
   MAX_HP = 20       
   def play_turn(warrior)
           #definicja poczatkowego hp
        @prev_health ||= MAX_HP
        #definicja w ktora strone isc
        @direction ||= :backward
       
        #po zwiedzeniu calego korytarza w prawo, pasuje zeby isc w lewo
        return @direction = :forward if is_wall?(warrior)
        
        display_status(warrior,@direction)
        
        #spi kiedy moze, czyli jak go nie bija
        return chill(warrior) if safe_to_rest?(warrior)
             
        #idzie w kierunku, gdy jest pusty
        return walk(warrior) if is_clear?(warrior)
        
        #idzie kiedy jest atakowany i czuje ze jest pusto
        return walk(warrior)   if under_attack?(warrior) && is_clear?(warrior)
        
        #zaatakowany kontratakuje
        return smash(warrior) if under_attack?(warrior) && !is_clear?(warrior)
   
        if !is_clear?(warrior)
            #sprawdzenie czy jest jeniec
            if !is_captive?(warrior)
                smash(warrior) 
            else 
                release(warrior)
            end
        end  
        @prev_health = warrior.health     
   end
   
   
   
   def walk(warrior)
        warrior.walk!(@direction)
   end
   
   def release(warrior)
        warrior.rescue!(@direction)
   end
   
   def smash(warrior)
        warrior.attack!(@direction)
   end
   
   def chill(warrior)
        warrior.rest!
   end
   
   def display_status(warrior,dir)
        print "Ide w kierunku " 
        print dir
        print " a przede mna czuje "
        print warrior.feel(dir)
        print " i mam "
        print warrior.health
        print " punktow zdrowia \r"
   end
   
   private 
   
   def under_attack?(warrior)
        @prev_health < warrior.health
   end
   
   def safe_to_rest?(warrior)
        wounded?(warrior) && !under_attack?(warrior)
   end     
   
   def wounded?(warrior)
        warrior.health < MAX_HP
   end
   
   def is_clear?(warrior)
        warrior.feel(@direction).empty?
   end
   
   def is_wall?(warrior)
        warrior.feel(@direction).wall? 
   end 
   
   def is_captive?(warrior)
        warrior.feel(@direction).captive? 
   end   
  
end

