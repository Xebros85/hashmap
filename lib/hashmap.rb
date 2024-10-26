
# Hashmap class

class HashMap
  def initialize    
    @bucket_size = 16
    @buckets = Array.new(@bucket_size)
  end

  def hash(key)    
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @bucket_size
  end

  def set(key, value)
    # Takes two arguments : "key" and "value" assigned to this key
    # If key already exists, then the old value is overwritten or we can say that we update the key's value
    index = hash(key)
    puts "Index: #{index}"
    @buckets[index] ||= []

    found_index = false

    @buckets[index].each do |pair|
      next unless pair[0] == key
      pair[1] = value
      found_index = true
      break
    end

    @buckets[index].push([key, value]) unless found_index
    load_factor = length.to_f / @bucket_size
    puts "Load Factor: #{load_factor}"
  end

  def get(key)
    # takes the arguement "key" and returns the value assigned to it.
  end

  def has?(key)
    # takes a key as argument and returns "true" or "false" based on whether or not the key is in the hashmap
  end

  def remove(key)
    # takes a key as arguement. If the given key is in the hash map, it should remove the entry with that key
    # and return the deleted entry's value. If the key isn't in the hashmap it should return "nil"
  end

  def length
    # returns the number of stored keys in the hashmap
  end

  def clear
    # removes ALL entries in the hashmap
    self.HashMap.initialize
  end

  def keys
    # returns an array containing all the keys inside the hashmap
  end

  def values
    # returns an array containing all the values
  end

  def entries
    # returns an array that contains each "key", "value" pair.
    # Example: [[first_key, first_value], [second_key, second_value]]
  end

end