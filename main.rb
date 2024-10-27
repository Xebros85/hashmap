# Project Hashmap

# The Odin Project
# Created by Xebros - 2024

require_relative "lib/hashmap"

test = HashMap.new

test.set("Ryan", "Dad")
test.set("Jess", "Mom")
test.set("Cadence", "Sister")
test.set("Jaxon", "Brother")

p test.entries
p test.keys
p test.values

puts "\nThe value for key 'Ryan' is:"
p test.get("Ryan")
p test.has?("Ryan")
 

p test.length
# test.clear

# p test.entries
# p test.keys
# p test.values