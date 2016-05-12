class String
    @colors_hash = {red: 31 , green: 32, yellow: 33, blue: 34, pink: 95, 
    light_blue: 36, white: 97, light_grey: 37, black: 30} 
    
    def self.create_colors
        @colors_hash.each do |color, value|
            self.send(:define_method, "#{color}") do
                "\e[#{value}m"+self+"\e[0m"
            end
        end
    end
    
    #creates each color option
    String.create_colors
      
    #returns array of all color options 
    def self.colors
        @colors_hash.keys
    end
    
    #prints sample output demonstrating all the colors 
    def self.sample_colors
        @colors_hash.each do |color, value| 
            puts "This is" + " #{color}".send(color)
        end
    end 
end

