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
        puts "Tribe #{@name.yellow} has the following members: #{@new_tribe.blue}."
    end
    
    def to_s
        @name
    end
    
    def tribal_council(immune = {})
        @members.reject{|member| member == immune[:immune]}.sample 
    end
    
    def delete(member)
        @members.delete(member)
    end
    
end

