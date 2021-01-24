class Player     
   def play_turn(warrior,player_hp=20,reg=0)
        #zauwazylem ze na poczatku @health jest nil, wiec w tej formie 
        #sie nie przydaje, zamiast poczatkowo definiowac, definiuje tylko jak
        #jest nilem, czyli na poczatku ale latwiej
        if @health.nil?
            @health=player_hp
        end
   
        #sprawdzanie czy dostalem po mordzie, health z poprzedniej tury, po
        #ktorej jest ruch przeciwnika, czyli ewenualny atak
        if @health>warrior.health
            can_rest=false
        else
            can_rest=true
        end
        
        #spi kiedy moze, czyli jak go nie bija
        if warrior.health<player_hp && can_rest
        warrior.rest!
        
        #jak chce spac ale go bija to musi zajebac, teoretycznie powniniem 
        #sprawdzic czy nie atakuje jeńca, a sam trace hp przez kogos z tylu
        elsif !can_rest
            if warrior.feel.empty?
                warrior.walk!
            else 
                warrior.attack!
            end
        #reszta standard, chodzi i bije
        elsif warrior.feel.empty?
            warrior.walk! :forward
        elsif !warrior.feel.empty?
            #sprawdzenie czy jest jeniec
            if !warrior.feel.captive?
                warrior.attack!
            else 
                warrior.rescue!
            end
        end
   
        @health=warrior.health
        
   end
end

