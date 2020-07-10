# HomeSuite: Your Virtual Realtor

## Table of Contents
* [About](#about-homesuite)
* [Video](#homesuite-walkthrough-video)
* [Techonologies](#technologies)
* [Setup](#setup)
* [Code Examples](#code-examples)
* [Features](#homesuite-features)
* [Status](#status)
* [Why HomeSuite](#why-homesuite)
* [Contact](#contact)
* [License](#license)

## About HomeSuite
HomeSuite is a CLI application that assists users in their home purchasing journey. The user starts out by providing their name and is soon prompted to give their preferences regarding their home purchase. Do they want a 2 bed 1 bath in Denver? Or do they prefer a 4 bed 3 bath in Boulder? View and view again until they decide on the house that is best.

## HomeSuite Walkthrough Video
[HomeSuite Virtual Realtor Walkthrough]

## Technologies
Ruby - version 2.6.1

ActiveRecord - version 6.0.3.2

SQLite3 - version 3.16

## Setup
To run this project, install it locally by cloning the GitHub repository and type:
```
  ruby runner.rb

```
## Code Examples

```
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
```
```
    def houses_viewed
        puts "You have viewed: "
        @houses_viewed = @user.houses.map do |house|
            puts house.address
            house.address
        # end.map do |house|
        #     house.address
        end
    end
```
## HomeSuite Features
* Select home preferences (bedrooms, bathrooms, etc.)
* Display the homes which match the user's preferences
* Allows the user to choose a house(s) to view
* Allows the user to buy a house based, overall deleting the bought house from the database

## Status
This app is completed to carry out CRUD framework. Features buying and viewing features could be expanded.

## Why HomeSuite?
We created this app based on our own affinity for looking through home apps such as Realtor and Trulia. We wanted this app to be personalized and flexible unlike the apps out on the market so set on to build HomeSuite with that exact intention!

## Contact
Created by [Hailey Ringier](https://www.linkedin.com/in/hailey-ringier/) and [Nyaradzo Bere](http://www.linkedin.com/in/nyaradzo-bere)

## License
[View Here](License.txt)
