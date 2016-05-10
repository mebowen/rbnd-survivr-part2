class Tribe
    attr_reader :name
    attr_accessor :members 
    
    def initialize(options)
        @name = options[:name]
        @members = options[:members]
        create_tribe
    end
    
    def create_tribe
        @new_tribe = @members.map{|member| "#{member.to_s.capitalize}"}.join(", ")
        print_tribe
    end
    
    def print_tribe
        puts "Tribe #{@name} has the following members: #{@new_tribe}."
    end
    
    def to_s
        @name
    end
    
    def tribal_council(options)
        @immune = options[:immune]
        @members.each_with_index do |member, index|
            return @members.delete_at(index) unless member == @immune
        end
    end
    
end

