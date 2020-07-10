class Cli
    
    attr_accessor :client_bedroom, :client_bathroom, :client_yard, :client_location, :available_houses, :house_addresses, :user, :houses_viewed, :house_bought

    def initialize  client_bedroom = 0, client_bathroom = 0, client_yard = true, client_location = "", available_houses = [], house_addresses = [], user = nil, houses_viewed = [], house_bought = ""
        @client_bedroom = client_bedroom
        @client_bathroom = client_bathroom
        @client_yard = client_yard
        @client_location = client_location
        @available_houses = available_houses
        @house_addresses = house_addresses
        @user = user
        @houses_viewed = houses_viewed
        @house_bought = house_bought
    end

    def welcome_user
        box = TTY::Box.frame "        HOMESUITE        ", "Welcome to Virtual Realtor!", padding: 1, align: :center, border: :thick
        puts box
        prompt = TTY::Prompt.new
        user_name = prompt.ask("May I get your name?")
        answer = Client.pluck(:name).include? user_name
        if answer == false 
            @user = Client.create(name: user_name)
        else
            @user = Client.find_by(name: user_name)
        end
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
        box = TTY::Box.frame "How many bedrooms does your dream home have?", align: :center
        prompt = TTY::Prompt.new
        @client_bedroom = 
            prompt.select(box, %w(1 2 3 4))
    end

    def bathroom_prompt
        box = TTY::Box.frame "How many bathrooms does your dream home have?", align: :center
        prompt = TTY::Prompt.new
        @client_bathroom = 
            prompt.select(box, %w(1 2 3 4))
    end

    def backyard_prompt
        box = TTY::Box.frame "Does your dream home have a backyard?", align: :center
        prompt = TTY::Prompt.new
        @client_yard = prompt.yes?(box, convert: :boolean)
    end

    def client_location
        box = TTY::Box.frame "What city would you like your dream home to be in?", align: :center
        prompt = TTY::Prompt.new
       @client_location = prompt.select(box, %w(Denver Littleton Boulder))
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
            box = TTY::Box.frame "#{n} house(s) matches your selections!", align: :center
            puts box
            puts @house_addresses
        end
    end

    def view_house
        box = TTY::Box.frame "Which house would you like to view?", align: :center
        prompt = TTY::Prompt.new
        house_address = prompt.select(box, @house_addresses)
        puts "Great! You'll be viewing #{house_address}!"
        @house_view = House.find_by(address: house_address)
        @house_view
        list_viewing
    end

    def view_new_house
        box = TTY::Box.frame "Would you like to view another house?", align: :center
        prompt = TTY::Prompt.new
        @view_new_house = 
            prompt.yes?(box, convert: :boolean)
        if @view_new_house == true
            self.view_house
            self.view_new_house
        else
            puts "No worries!"
        end
    end
    
    def list_viewing
        Viewing.create(client: @user, house: @house_view)
    end

    def houses_viewed
        box = TTY::Box.frame "You have viewed: ", align: :center
        @houses_viewed = @user.houses.map do |house|
            puts house.address
            house.address
        end
    end

    def buy_house
        box1 = TTY::Box.frame "Below are the houses you have viewed. Select the one you would like to buy.", align: :center
        prompt = TTY::Prompt.new
        @house_bought = prompt.select(box1, @houses_viewed)
        box2 = TTY::Box.frame "CONGRATULATIONS!", "You just bought #{@house_bought}",
            padding: 1, align: :center, border: :thick
        puts box2
    end

    def delete
        house_delete = House.find_by(address: @house_bought)
            house_delete.destroy
        box = TTY::Box.frame "Available houses are now: ", align: :center
        puts box
        puts House.all.pluck(:address)
    end

    def goodbye
        box = TTY::Box.frame "Thank you for visiting Virtual Realtor!", "Have a great day!", 
            padding: 1,
            align: :center,
            border: :thick
        puts box
    end

    # def options_menu
    #     prompt = TTY::Prompt.new
    #     prompt.select("What would you like to do?") do |menu|
    #         menu.choice "Find a house"
    #         menu.choice "See all the houses you have viewed"
    #         menu.choice "Exit"
    #     end
    # end

end
