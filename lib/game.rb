class Game
    attr_reader :tribes
    
    def initialize(tribe_1, tribe_2)
        @tribes = [tribe_1, tribe_2]
    end
    
    def add_tribe(tribe_three)
        @tribes << tribe_three
    end
    
    def immunity_challenge
        @tribes.sample 
    end
    
    def clear_tribes
        @tribes.clear
    end
    
    def merge(combined_tribe)
        Tribe.new({name: combined_tribe, members: @tribes[0].members + @tribes[1].members})
    end
    
    def individual_immunity_challenge
        @tribes.sample.members.sample
    end
    
end 

