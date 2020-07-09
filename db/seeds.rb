

# to avoid duplicates, every time we reseed (rake db:seed )

Viewing.destroy_all
Client.destroy_all
House.destroy_all

# create 18-20 houses, beds max = 2, bath max = 2

house1 = House.create(bedrooms: 1, bathrooms: 1, yard: true, location: "Denver", address: "3350 Clarkson St.")
house2 = House.create(bedrooms: 1, bathrooms: 1, yard: false, location: "Denver", address: "940 University Blvd.")
house3 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Denver", address: "868 Fox St.")
house4 = House.create(bedrooms: 1, bathrooms: 2, yard: false, location: "Denver", address: "3738 Lafayette St.")
house17 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Denver", address: "3046 Milwaukee St.")
house18 = House.create(bedrooms: 2, bathrooms: 2, yard: true, location: "Denver", address: "1902 16th Ave.")
house19 = House.create(bedrooms: 2, bathrooms: 1, yard: false, location: "Denver", address: "2345 Walnut St.")
house12 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Denver", address: "2823 Walnut St.")
house12 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Denver", address: "6915 Martin Luther King Blvd.")

house5 = House.create(bedrooms: 1, bathrooms: 1, yard: true, location: "Boulder", address: "3375 14th St.")
house6 = House.create(bedrooms: 1, bathrooms: 1, yard: false, location: "Boulder", address: "3040 10th St.")
house7 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Boulder", address: "3875 Cloverleaf Dr.")
house8 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Boulder", address: "932 Arapahoe Ave.")
house12 = House.create(bedrooms: 2, bathrooms: 2, yard: true, location: "Boulder", address: "3143 Fern St.")
house20 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Boulder", address: "4357 Hampton Pl.")
house21 = House.create(bedrooms: 2, bathrooms: 1, yard: false, location: "Boulder", address: "5007 Coventry Ct.")
house22 = House.create(bedrooms: 2, bathrooms: 2, yard: true, location: "Boulder", address: "930 Grant Pl.")
house12 = House.create(bedrooms: 1, bathrooms: 2, yard: false, location: "Boulder", address: "1810 Hillside Rd.")
house12 = House.create(bedrooms: 2, bathrooms: 2, yard: true, location: "Boulder", address: "1111 Utica Blvd.")


house9 = House.create(bedrooms: 1, bathrooms: 1, yard: true, location: "Littleton", address: "6220 Windermere St.")
house10 = House.create(bedrooms: 1, bathrooms: 1, yard: true, location: "Littleton", address: "2418 Bradbury Ave.")
house11 = House.create(bedrooms: 1, bathrooms: 1, yard: false, location: "Littleton", address: "805 Peakview Circle")
house12 = House.create(bedrooms: 1, bathrooms: 2, yard: false, location: "Littleton", address: "329 Jamison Circle")
house13 = House.create(bedrooms: 1, bathrooms: 2, yard: true, location: "Littleton", address: "885 Briarwood Dr.")
house14 = House.create(bedrooms: 2, bathrooms: 1, yard: false, location: "Littleton", address: "1507 Cottonwood Ln")
house15 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Littleton", address: "5307 Cody St.")
house16 = House.create(bedrooms: 2, bathrooms: 1, yard: true, location: "Littleton", address: "5425 Lowell Blvd.")
house16 = House.create(bedrooms: 2, bathrooms: 2, yard: true, location: "Littleton", address: "8138 Stonybridge Circle")
house16 = House.create(bedrooms: 2, bathrooms: 2, yard: false, location: "Littleton", address: "8517 Upham Way")