class Cli

    
    # See if variables can be kept within the method 
    @client_bedroom = 0
    @client_bathroom = 0
    @client_yard = t
    @client_location = ""


    def welcome_user
        puts "Hello there! May I get your name?"
        @name = gets.chomp
        # Put conditional: Already a client? If not, create.new client
        puts "Hello #{name}, Would you like to see a house today? Just say 'yes' or 'no'."
        # See if they would either like to see a house or look at previous viewings
        answer = gets.chomp
        # Ask Questions for their house selections. Insert method here
    end
    
def welcome_user
    puts "Welcome to Virtual Realtor"
    prompt = TTY::Prompt.new
    name = prompt.ask("May I get your name?")
#   are they a client already?
    answer = client.all.include? (name)
#   .include? returns a boolean
#   if they are not, then create a new client instance
    end
    if anwser == false 
    Client.create(name: name)
end


    def bedroom_prompt
        puts "How many bedrooms would you like your house to have? Choose between 1-2."
        @client_bedroom = gets.strip
    end

    def bedroom_prompt
        prompt = TTY::Prompt.new
        @client_bedroom = 
            prompt.select("How many bedrooms does your dream home have?", %w(1 2))
    end

    # Allow User to select one of the choices. Make sure there are no duplicates
    
    def bathroom_prompt
        puts "How many bathrooms would you like your house to have? 1-2"
        @client_bathroom = gets.strip
    end
    # Allow User to select one of the choices. Make sure there are no duplicates
    
    def bathroom_prompt
        prompt = TTY::Prompt.new
        @client_bathroom = 
            prompt.select("How many bathrooms does your dream home have?", %w(1 2))
    end


    def backyard_prompt
        puts "Does this dream house need to have a backyard? Just choose 'yes' or 'no'."
        @client_yard = gets.strip
        # if backyard_choice == "yes"
        #     # Filter selections based on backyard
        # else
        #     # Still show a house even if it has a backyard. I.E. Show everything, don't filter
        # end
    end

    def backyard_prompt
        prompt = TTY::Prompt.new
        @client_yard = 
            prompt.yes?("Does your dream home have a backyard?", convert: :boolean)
    end

    def location_prompt
        puts "Does this dream house need to have a backyard?
        Just choose between Denver, Littleton, and Boulder."
        @client_location = gets.strip
    end
    
    def client_location
        prompt = TTY::Prompt.new
       @client_location =  prompt.select("What city would you like your dream home to be in?", %w(Denver Littleton Boulder))
    end
    
    def house_options
        # pull the houses that fulfill each filter
        # House.select do 
        # provide array of homes that fulfill filters
        # Ask user which house they would like to view first
    end
    
    # def house_filter
    #     available_houses = House.select do |house|
    #         House[@client_bedroom] == house["bedrooms"] 
    #       @client_bedroom == house["bedrooms"]
    #         && House[@client_bathroom] == house["bathrooms"] 
    #         # Insert conditional for boolean backyard
    #         && @client_yard == house["yard"]
    #     end
    # end

    def house_filter
        available_house = House.select do |house|
            @client_bedroom == house.bedrooms
            && @client_bathroom == house.bathrooms
            && @client_yard == house.yard
            && @client_location == house.location
        end
    puts available_house.to_s #need to seperate by line or with commas
    #maybe we could do a count available_house.length"N houses matched your search"
end
