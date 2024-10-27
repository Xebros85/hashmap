
# Hashmap class

class HashMap
  def initialize
    @max_load_factor = 0.75    
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
    puts "Key: #{key} => Index: #{index}"
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
    resize_map if load_factor > @max_load_factor
  end

  def resize_map
    @bucket_size *= 2
    more_buckets = Array.new(@bucket_size)

    @buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |pair|
        index = hash(pair[0])
        more_buckets[index] ||= []
        more_buckets[index].push(pair)
      end
    end
    @buckets = more_buckets
  end

  def get(key)
    # takes the arguement "key" and returns the value assigned to it.
    index = hash(key)

    return nil if @buckets[index].nil?

    @buckets[index].each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def has?(key)
    # takes a key as argument and returns "true" or "false" based on whether or not the key is in the hashmap
    return true unless get(key).nil?
    false
  end

  def remove(key)
    # takes a key as arguement. If the given key is in the hash map, it should remove the entry with that key
    # and return the deleted entry's value. If the key isn't in the hashmap it should return "nil"
    index = hash(key)

    return nil if @buckets[index].nil?

    @buckets[index].each_with_index do |pair, p_index|
      next unless pair[0] == key
      @buckets[index].delete_at(p_index)
      return pair[1]
    end
  end

  def length
    # returns the number of stored keys in the hashmap
    count = 0

    @buckets.each do |bucket|
      count += bucket.length unless bucket.nil?
    end
    count
  end

  def clear
    # removes ALL entries in the hashmap
    puts "\nAll values reset."
    self.initialize
  end

  def keys
    # returns an array containing all the keys inside the hashmap
    puts "\nHere are the keys in the HashMap:"
    bucket_keys = []

    @buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |pair|
        bucket_keys.push(pair[0])
      end
    end

    bucket_keys
  end

  def values
    # returns an array containing all the values
    puts "\nHere are the values in the HashMap:"
    bucket_values = []

    @buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |pair|
        bucket_values.push(pair[1])
      end
    end

    bucket_values
  end

  def entries
    # returns an array that contains each "key", "value" pair.
    # Example: [[first_key, first_value], [second_key, second_value]]
    puts "\nHere are the entries in the HashMap:"
    bucket_entries = []

    @buckets.each do |bucket|
      next if bucket.nil?

      bucket.each do |pair|
        bucket_entries.push(pair)
      end
    end

    bucket_entries
  end

end