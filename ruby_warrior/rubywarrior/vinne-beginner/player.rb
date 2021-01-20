class Player
    def play_turn(warrior)
        if warrior.health>5 && warrior.feel.empty?
            warrior.walk!
            puts "im going on an adventure!"
         elsif warrior.health>5 && !warrior.feel.empty?
            warrior.attack!
            puts "napierdalac"
         elsif warrior.health<=5 && !warrior.feel.empty?
            warrior.walk! :backward
            puts "odwrot!"
         else
            warrior.rest!
            puts "odpoczywam biedaku"
            
            
        end
    end
end

