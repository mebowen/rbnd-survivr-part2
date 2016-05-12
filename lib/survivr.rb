require 'colorizr'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================
#This is where you will write your code for the three phases

def phase_one
    puts "_________"
    puts "PHASE ONE"
    puts "_________"
    8.times do 
        grant_immunity_to_tribe
        vote_off_contestant_from_phase_one
        @borneo.clear_tribes
        @borneo.add_tribe(@tribe_immune)
        @borneo.add_tribe(@tribe_not_immune)
        puts
    end
end

def phase_two
    puts "_________"
    puts "PHASE TWO"
    puts "_________"
    3.times do 
        grant_immunity_to_contestant
        vote_off_contestant_from_merged_tribe
        @borneo.clear_tribes
        @borneo.add_tribe(@merge_tribe)
        puts
    end
end

def phase_three
    puts "___________"
    puts "PHASE THREE"
    puts "___________"
    7.times do 
        grant_immunity_to_contestant
        vote_off_contestant_from_merged_tribe
        @jury.add_member(@contestant_voted_off)
        puts
    end
end

private 

def grant_immunity_to_tribe
    tribes = @borneo.tribes 
    @tribe_immune = @borneo.immunity_challenge
    if @tribe_immune == tribes[0]
        @tribe_not_immune = tribes[1]
    else
        @tribe_not_immune = tribes[0]
    end
end

def grant_immunity_to_contestant
    @immune = @borneo.individual_immunity_challenge
    puts "#{@immune.to_s.capitalize.green} won the individual immunity challenge!"
end

def vote_off_contestant_from_phase_one
    puts "Tribe #{@tribe_not_immune.to_s.capitalize.yellow} lost the immunity challenge and will be voting off a member: "
    contestant_voted_off = @tribe_not_immune.tribal_council
    puts "#{contestant_voted_off.to_s.capitalize.red} was voted off."
    @tribe_not_immune.delete(contestant_voted_off)
end

def vote_off_contestant_from_merged_tribe
    @contestant_voted_off = @merge_tribe.tribal_council(immune: @immune)
    puts "#{@contestant_voted_off.to_s.capitalize.red} was voted off."
    @merge_tribe.delete(@contestant_voted_off)
end
    

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
