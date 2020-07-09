# class Cli

    @name = ""
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
    
    
    
    def bedroom_prompt
        puts "How many bedrooms would you like your house to have? Choose between 1-2."
        @client_bedroom = gets.strip
    end
    # Allow User to select one of the choices. Make sure there are no duplicates
    
    def bathroom_prompt
        puts "How many bathrooms would you like your house to have? 1-2"
        @client_bathroom = gets.strip
    end
    # Allow User to select one of the choices. Make sure there are no duplicates
    
    def backyard_prompt
        puts "Does this dream house need to have a backyard? Just choose 'yes' or 'no'."
        @client_yard = gets.strip
        # if backyard_choice == "yes"
        #     # Filter selections based on backyard
        # else
        #     # Still show a house even if it has a backyard. I.E. Show everything, don't filter
        # end
    end

    def location_prompt
        puts "Does this dream house need to have a backyard?
        Just choose between Denver, Littleton, and Boulder."
        @client_location = gets.strip
    end
    
#     def house_options
#         # pull the houses that fulfill each filter
#         # House.select do 
#         # provide array of homes that fulfill filters
#         # Ask user which house they would like to view first
#     end
    
    # def house_filter
    #     available_houses = House.select do |house|
    #         House[@client_bedroom] == house["bedrooms"] 
    #       @client_bedroom == house["bedrooms"]
    #         && House[@client_bathroom] == house["bathrooms"] 
    #         # Insert conditional for boolean backyard
    #     end
    # end

     
# end

welcome_user
bedroom_prompt