# Note: we're looking for Ruby commands for the below questions, not the actual answers, unless it's a question. 

# Hint: you can type "irb" in your terminal to get a Ruby console to test things out. For multi-line code, use an editor that can run Ruby code, or copy/paste into irb.

# Hint 2: you can refer to the Ruby doc for Array and Hash here: 

# http://www.ruby-doc.org/core-1.9.3/Array.html
# http://www.ruby-doc.org/core-1.9.3/Hash.html


# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
arr = [1,2,3,4,5,6,7,8,9,10]

arr.each {|number| puts number}

# 2. Same as above, but only print out values greater than 5.

arr.each {|number| puts number if number > 5}

# 3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.

arr.select {|number| puts number if number % 2 != 0}
#or
arr.select {|number| puts number if number.odd?}

# 4. Append "11" to the end of the array. Prepend "0" to the beginning.

arr.push(11)
puts arr
arr.unshift(0)
puts arr

# 5. Get rid of "11". And append a "3".

arr.pop(11)
puts arr
arr.push(3)
puts arr

# 6. Get rid of duplicates without specifically removing any one value. 

puts arr.uniq

# 7. What's the major difference between an Array and a Hash?
#array is an indexed based sequence of elements starting at 0 while a hash is a key:value pair

# 8. Create a Hash using both Ruby 1.8 and 1.9 syntax.

#ruby 1.8
h = {:a => 1, :b => 2}
#ruby 1.9
h = {a:1, b:2}

# Suppose you have a h = {a:1, b:2, c:3, d:4}

# 9. Get the value of key "b".
h[:b]

# 10. Add to this hash the key:value pair {e:5}
h[:e]=5

# 13. Remove all key:value pairs whose value is less than 3.5
h.delete_if {|k,v| v <= 3.5}

# 14. Can hash values be arrays? Can you have an array of hashes? (give examples)
#yes, you can have array values in hashes
names=['dave','tom','cat']
data=[name:names,g:5]
#yes, you can also have an array of hashes
h={a:1,b:4,c:54}
h[:a]=names

# 15. Look at several Rails/Ruby online API sources and say which one your like best and why.
#http://ruby-doc.org/ seems the clearest for me.  I like the layout and find things more easily.

