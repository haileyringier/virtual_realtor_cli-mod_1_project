

# to avoid duplicates, every time we reseed (rake db:seed )

Viewing.destroy_all
Client.destroy_all
House.destroy_all

# create 18-20 houses, beds max = 2, bath max = 2

house1 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Denver")
house2 = House.create(bedrooms: 2, bathrooms: 2, yard: true, location: "Denver")
house3 = House.create(bedrooms: 1, bathrooms: 1, yard: false, location: "Denver")
house4 = House.create(bedrooms: 2, bathrooms: 1, yard: false, location: "Denver")
house5 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Boulder")
house6 = House.create(bedrooms: 2, bathrooms: 2, yard: false, location: "Boulder")
house7 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Boulder")
house8 = House.create(bedrooms: 1, bathrooms: 1, yard: true, location: "Boulder")
house9 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Littleton")
house10 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Littleton")
house11 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Littleton")
house12 = House.create(bedrooms: 2, bathrooms: 2, yard: false, location: "Littleton")
