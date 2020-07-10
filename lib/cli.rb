class Cli

    @client_bedroom = 0
    @client_bathroom = 0
    @client_yard = true
    @client_location = ""
    @available_houses = []
    @house_addresses = []
    @user = nil
    @house_view = nil
    @houses_viewed = []

    def welcome_user
        box = TTY::Box.frame "Welcome to Virtual Realtor", padding: 1, align: :center, border: :thick
        puts box
        prompt = TTY::Prompt.new
        user_name = prompt.ask("May I get your name?")
        answer = Client.all.name.include? user_name
        if answer == false 
            @user = Client.create(name: user_name)
    end

    def house_quiz
        puts "Answer a few questions to find your dream home!"
        bedroom_prompt
        bathroom_prompt
        backyard_prompt
        client_location
        puts "You are one step closer to finding your home sweet home."
        house_filter
    end

    def bedroom_prompt
        prompt = TTY::Prompt.new
        @client_bedroom = 
            prompt.select("How many bedrooms does your dream home have?", %w(1 2))
    end

    def bathroom_prompt
        prompt = TTY::Prompt.new
        @client_bathroom = 
            prompt.select("How many bathrooms does your dream home have?", %w(1 2))
    end

    def backyard_prompt
        prompt = TTY::Prompt.new
        @client_yard = 
            prompt.yes?("Does your dream home have a backyard?", convert: :boolean)
    end
    
    def client_location
        prompt = TTY::Prompt.new
       @client_location =  prompt.select("What city would you like your dream home to be in?", %w(Denver Littleton Boulder))
    end
    
    def house_filter
        @available_houses = House.all.find_all do |house|
            house.bedrooms.to_i == @client_bedroom.to_i
        end.find_all do |house|
            house.bathrooms.to_i == @client_bathroom.to_i
        end.find_all do |house|
            house.yard == @client_yard
        end.find_all do |house|
            house.location.to_s == @client_location.to_s
        end
        @house_addresses = @available_houses.map do |house|
            house.address
        end
        n = @house_addresses.length
        if n == 0
            puts "No houses match your selection, please try again."
            house_quiz
        else
            puts "#{n} house(s) matches your selections!"
            puts @house_addresses
        end
    end

    def view_house
        prompt = TTY::Prompt.new
        house_address = prompt.select("Which house would you like to view?", @house_addresses)
        puts "Great! You'll be viewing #{house_address}!"
        @house_view = House.find_by(address: house_address)
        return @house_view
    end

    def new_viewing
        Viewing.create(client: @user, house: @house_view)
    end

    def houses_viewed
        puts "You have viewed: "
        @houses_viewed = @user.viewings.map do |viewing|
            puts viewing.house.address
            viewing.house.address
        end
        binding.pry
    end

    def buy_house
        prompt = TTY::Prompt.new
        @house_bought = prompt.select("Below are the houses you have viewed. Select the one you would like to buy.", @houses_viewed)
        #puts "Congratulations! You just bought #{@house_bought}!"
        box = TTY::Box.frame "CONGRATULATIONS!", "You just bought #{@house_bought}",
            padding: 1, align: :center, border: :thick
        puts box
    end

    def delete
        @user.destroy
        house_delete = House.find_by(address: @house_bought)
        house_delete.destroy
        puts "Available houses are now #{House.all.pluck(:address)}"
    end
    # Find way to display in cleaner fashion i.e. list
    # When delete is run, must re-input seeds into database and migrate. Find workaround

    def goodbye
        box = TTY::Box.frame "Thank for visiting Virtual Realtor!", "Have a great day!", 
            padding: 1,
            align: :center,
            border: :thick
        puts box
    end

    def options_menu
        prompt = TTY::Prompt.new
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Find a house"
            menu.choice "See all the houses you have viewed"
            menu.choice "Exit"
        end
    end

end
end
