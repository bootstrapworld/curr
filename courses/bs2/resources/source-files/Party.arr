data Party:
    # A party is represented by a location, a theme, and a number of guests.
  | party(location :: String, theme :: String, guests :: Number)
end

Halloween = party("school", "costume", 10)
Summer = party("beach", "luau", 7)
JulyFourth = party("backyard", "barbecue", 12)