class Player  
   MAX_HP = 20   
   def play_turn(warrior)       
        #zauwazylem ze na poczatku @health jest nil, wiec w tej formie 
        #sie nie przydaje, zamiast poczatkowo definiowac, definiuje tylko jak
        #jest nilem, czyli na poczatku ale latwiej
        @prev_health ||= MAX_HP
       
        #spi kiedy moze, czyli jak go nie bija
        return warrior.rest! if wounded?(warrior.health) && under_attack?
             
        #jak chce spac ale go bija to musi zajebac, teoretycznie powniniem 
        #sprawdzic czy nie atakuje jeńca, a sam trace hp przez kogos z tylu
        return warrior.walk! if warrior.feel.empty?
        
        return warrior.walk  if under_attack? && warrior.feel.empty?
        
        return warrior.attack if under_attack? && !warrior.feel.empty?

        if !warrior.feel.empty?
            #sprawdzenie czy jest jeniec
            if !warrior.feel.captive?
                warrior.attack!
            else 
                warrior.rescue!
            end
        end
   
        @prev_health = warrior.health
        
   end
   
   private
   
   def under_attack?
        @prev_health < warrior.health
   end
   
   def wounded?
    warrior.health < MAX_XP
   end
   
end

