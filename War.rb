class Game
    def initialize
        deck = [2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14]
        shuffled_deck = deck.shuffle
        deck1 = shuffled_deck[0..25]
        deck2 = shuffled_deck[26..51]

        @hand_1 = deck1.shuffle
        @hand_2 = deck2.shuffle
        @num_of_turns = 0
    end

    def to_face(number)
        if number <= 10
            return number
        elsif number == 11
            return "Jack"
        elsif number == 12
            return "Queen"
        elsif number == 13
            return "King"
        elsif number == 14
            return "Ace"
        end
    end



    def play_turn

       while @hand_1.length != 0 && @hand_2.length != 0
         puts "Turn #{@num_of_turns + 1}:"
         if @hand_1[0] <= 10
           puts "Liam: #{@hand_1[0]}"
         elsif @hand_1[0] == 11 
           puts "Liam: Jack"
         elsif @hand_1[0] == 12
           puts "Liam: Queen"
         elsif @hand_1[0] == 13 
           puts "Liam: King"
         elsif @hand_1[0] == 14
           puts "Liam: Ace"
         end
         if @hand_2[0] <= 10
           puts "Grandma: #{@hand_2[0]}"
         elsif @hand_2[0] == 11 
           puts "Grandma: Jack"
         elsif @hand_2[0] == 12
           puts "Grandma: Queen"
         elsif @hand_2[0] == 13 
           puts "Grandma: King"
         elsif @hand_2[0] == 14
           puts "Grandma: Ace"
         end
         

         if @hand_1[0] > @hand_2[0]
           puts "Liam wins that round!"
           puts "-------------------------"
           @hand_1 << @hand_1[0]
           @hand_1 << @hand_2[0]
           @hand_1.delete_at(0)
           @hand_2.delete_at(0)
         elsif @hand_1[0] < @hand_2[0]
           puts "Grandma wins that round!"
           puts "-------------------------"
           @hand_2 << @hand_1[0]
           @hand_2 << @hand_2[0]
           @hand_1.delete_at(0)
           @hand_2.delete_at(0)
         else
           puts "THIS MEANS WAR!!!"
           if @hand_1.length < 5
             puts "Grandma Wins!"
             break
           elsif @hand_2.length < 5
             puts "Liam Wins!"
             break
           else
             @hand_1 << @hand_1[0]
             @hand_2 << @hand_2[0]
             @hand_1.delete_at(0)
             @hand_2.delete_at(0)
             puts "Liam puts down: #{to_face(@hand_1[0])}, #{to_face(@hand_1[1])}, #{to_face(@hand_1[2])}. And the the face up card is: #{to_face(@hand_1[3])}"
             puts "Grandma puts down: #{to_face(@hand_2[0])}, #{to_face(@hand_2[1])}, #{to_face(@hand_2[2])}. And the the face up card is: #{to_face(@hand_2[3])}"
             if @hand_1[3] > @hand_2[3]
               puts "Liam wins that round!"
               puts "-------------------------"
               @hand_1 << @hand_1[0]
               @hand_1 << @hand_1[1]
               @hand_1 << @hand_1[2]
               @hand_1 << @hand_1[3]
               @hand_1 << @hand_2[0]
               @hand_1 << @hand_2[1]
               @hand_1 << @hand_2[2]
               @hand_1 << @hand_2[3]
               @hand_1.delete_at(0)
               @hand_1.delete_at(1)
               @hand_1.delete_at(2)
               @hand_1.delete_at(3)
               @hand_2.delete_at(0)
               @hand_2.delete_at(1)
               @hand_2.delete_at(2)
               @hand_2.delete_at(3)
             elsif @hand_1[3] < @hand_2[3]
               puts "Grandma wins that round!"
               puts "-------------------------"
                @hand_2 << @hand_1[0]
                @hand_2 << @hand_1[1]
                @hand_2 << @hand_1[2]
                @hand_2 << @hand_1[3]
                @hand_2 << @hand_2[0]
                @hand_2 << @hand_2[1]
                @hand_2 << @hand_2[2]
                @hand_2 << @hand_2[3]
                @hand_1.delete_at(0)
                @hand_1.delete_at(1)
                @hand_1.delete_at(2)
                @hand_1.delete_at(3)
                @hand_2.delete_at(0)
                @hand_2.delete_at(1)
                @hand_2.delete_at(2)
                @hand_2.delete_at(3)
              end
            end
        end
            @num_of_turns += 1
    end
    if @hand_1.length == 0
        puts "Grandma Wins!!!"
    else
        puts "Liam Wins!!!"
    end

  end
end

game = Game.new
game.play_turn



       

        


