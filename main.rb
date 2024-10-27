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

test.show_stats

p test.entries
p test.keys

# test.set("apple", "green")
# p test.entries

test.set("moon", "silver")
p test.entries
p test.get("carrot")


test.show_stats
