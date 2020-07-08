class Cli

    $user = ""

    def welcome
        puts "Hello! Welcome to Virtual Realtor!"
        puts "Prompt to input client info"
    end

    def user sign_up_or_sign_in
        $user = gets.strip
        puts "Hi ${user}"
    end 
     #create method 
end
