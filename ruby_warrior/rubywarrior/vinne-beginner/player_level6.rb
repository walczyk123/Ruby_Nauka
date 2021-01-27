class Player 
   MAX_HP = 20       
   def play_turn(warrior)
        #definicja poczatkowego hp
        @prev_health ||= MAX_HP
        #definicja w ktora strone isc
        @direction ||= :backward
        #poczatkowo nie regeneruje
        @regenerating ||= false
        #po zwiedzeniu calego korytarza w prawo, pasuje zeby isc w lewo
        return @direction = :forward if is_wall?(warrior)
        
        display_status(warrior,@direction)
       
        if @regenerating == false and !badly_wounded?(warrior) 
            #spi kiedy moze, czyli jak go nie bija      
            return chill(warrior) if safe_to_rest?(warrior)
        
            #idzie w kierunku, gdy jest pusty
            return walk(warrior) if is_clear?(warrior)
            
            #idzie kiedy jest atakowany i czuje ze jest pusto
            return walk(warrior)   if under_attack?(warrior) && is_clear?(warrior)
            
            #zaatakowany kontratakuje
            return smash(warrior) if under_attack?(warrior) && !is_clear?(warrior)
            
            #sprawdzam co przed nim
            if !is_clear?(warrior)
                return smash(warrior) if !is_captive?(warrior)
                return release(warrior) if is_captive?(warrior)     
            end  
        else
            @regenerating = true
            @direction = :backward
            return flee(warrior) if !is_wall?(warrior)  
            return chill(warrior) if is_wall?(warrior)
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
        warrior.rest!n   
        @direction = :forward
        return @regenerating = false if !wounded?(warrior)
   end
   
   def flee(warrior)
        warrior.walk!(:backward)
   end
   
   def display_status(warrior,dir)
        print "\r Ide w kierunku " 
        print dir
        print " a przede mna czuje "
        print warrior.feel(dir)
        print " i mam "
        print warrior.health
        print " punktow zdrowia \r"
   end
   
   private 
   
   def badly_wounded?(warrior)
        warrior.health < MAX_HP/20*9
   end
   
   def under_attack?(warrior)
        @prev_health < warrior.health
   end
   
   def safe_to_rest?(warrior)
        wounded?(warrior) && !under_attack?(warrior) && !!is_captive?(warrior)
   end 
   
   def retreat(warrior)
        warrior.walk!(:backward)
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

