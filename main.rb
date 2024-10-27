# Project Hashmap

# The Odin Project
# Created by Xebros - 2024

require_relative "lib/hashmap"

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "\nLength of HashMap: #{test.length}"
p test.entries



# p test.keys
# p test.values

 






# test.clear
# p test.entries