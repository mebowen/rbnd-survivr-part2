class Jury
    attr_accessor :members
    
    def initialize 
        @members = []
    end
    
    def add_member(member)
        @members << member
    end
    
    def cast_votes(finalists)
        total_votes = {finalists[0] => 0, finalists[1] => 0}
        @members.each do |member|
            vote = finalists.sample
            puts "#{member} voted for #{vote}"
            total_votes[vote] += 1 
        end
        return total_votes 
    end
    
    def report_votes(total_votes)
        total_votes.each do |finalist, vote_count|
            puts "#{finalist} got #{vote_count}."
        end
    end
    
    def announce_winner(total_votes)
        winner = total_votes.sort_by {|finalist, vote_count| vote_count}
        return winner.last.first 
    end
end

