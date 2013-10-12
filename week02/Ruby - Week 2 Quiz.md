# Week 2 Quiz
1. Name what each of the below is:
  <pre><code>a = 1 # => ex. a is a local variable, and is a Fixnum object with value 1
    @a = 2
    user = User.new
    user.name
    user.name = "Joe"</code></pre>

    <pre><code>@a =2 #=> @a is an instance variable that is a Fixnum object with a value of 2
      user = User.new #=> user is an object of the User class
      user.name # => calls the instance method "name" of the User class
      user. name = "Joe" #=> calls the User class setter method to set the value of name where Joe is a string object</code></pre>
2. How does a class mixin a module?
  <pre><code>using a modele definition prior to the class</code></pre>
3. What's the difference between class variables and instance variables?
  <pre><code>A class variable belongs to a class, not an object, where each object has access to its class variables. 
    An instance variable is a variable defined in a class where each object in the class has a separate copy.</code></pre>
4. What does `attr_accessor` do?
  <pre><code>It automatically creates a getter and setter method and its instance variables.</code></pre>
5. How would you describe this expression: `Dog.some_method`
  <pre><code>The expression is calling the instance method "some_method" for the Dog class</code></pre>
6. In Ruby, what's the difference between subclassing and mixing in modules?
  <pre><code>Subclassing is inheriting all behaviors of the parent/superclass while mixins are used for injecting the class 
    with a specific behavior</code></pre>
7. Given that I can instantiate a user like this: `User.new('Bob')`, what would the `initialize` method look like for the `User` class?
  <pre><code>def initialize(n)
      @name = n
      end
      *assuming the User class has an attr_accessor for :name</code></pre>
8. Can you call instance methods of the same class from other instance methods in that class?
  <pre><code>Yes, you can</code></pre>
9. When you get stuck, what's the process you use to try to trap the error?
  <pre><code>Using the pry gem, you can have multiple binding.pry to try and track down the errors and test the value 
    of objects/variables</code></pre>
