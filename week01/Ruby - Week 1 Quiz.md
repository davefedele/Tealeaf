# Week 1 Quiz
1. What is the value of `a` after the below code is executed?
  <pre><code>a = 1
    b = a
    b = 3</code></pre>
  Answer = 1
2. What's the difference between an `Array` and a `Hash`?
  Answer = An array is a list of ordered elements while a hash is an unordered list of elements that is a colletion of key:value pairs.
3. Every Ruby expression returns a value. Say what value is returned in the below expressions:
    * `arr = [1, 2, 3, 3]`
    * `[1, 2, 3, 3].uniq`
    * `[1, 2, 3, 3].uniq!`
    Answer = [1,2,3]
4. What's the difference between the `map` and `select` methods for the `Array` class? Give an example of when you'd use one versus the other.
  Answer = The map method creates a new array based on an old array where the values are modified by a supplied block. The select method returns an array containing those elements for which the block returns true.

    arr = [1,3,4,5,6,7,11,243]
    
    arr.map {|e| e*3}
    => [3, 9, 12, 15, 18, 21, 33, 729] 

    arr.select {|v| v > 4}
    => [5, 6, 7, 11, 243] 
5. Say you wanted to create a `Hash`. How would you do so if you wanted the hash keys to be `String` objects instead of symbols?
  Answer = H = {'someString' => 54}
6. What is returned?
  <pre><code>x = 1
    x.odd? ? "no way!" : "yes, sir!"</code></pre>
    Answer = "no way!"
7. What is x?
  <pre><code>x = 1
    3.times do
      x += 1
    end
    puts x
  </code></pre>
  Answer = 4
8. What is x?
  <pre><code>3.times do
      x += 1
    end
    puts x
  </code></pre>
  Answer = 7 if following the code above. If run alone, it returns 3.