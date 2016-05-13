require 'colorizr'

class Jury
    attr_accessor :members
    
    def initialize 
        @members = []
    end
    
    def add_member(member)
        @members << member
    end
    
    #returns a hash of random votes for the two finalists from the jury members
    def cast_votes(finalists)
        total_votes = {finalists[0] => 0, finalists[1] => 0}
        @members.each do |member|
            vote = finalists.sample
            puts "#{member.to_s.capitalize.pink} voted for #{vote.to_s.capitalize.light_blue}."
            total_votes[vote] += 1 
        end
        total_votes 
    end
    
    #prints the total votes for each finalist 
    def report_votes(total_votes)
        total_votes.each do |finalist, vote_count|
            puts "#{finalist.to_s.capitalize.light_blue} received #{vote_count.to_s.yellow} votes."
        end
    end
    
    #sorts total votes by vote count and then returns the finalist with the highest vote count 
    def announce_winner(total_votes)
        winner = total_votes.sort_by {|finalist, vote_count| vote_count}.last
        puts "#{winner[0].to_s.capitalize.green} is the winner!"
        winner[0]
    end
end