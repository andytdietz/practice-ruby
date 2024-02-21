# C. Use hashes with symbols to represent the following scenario:
# C.1 - You are the owner of a store that sells items (you decide what specifically). Each item has various properties such as color, price, etc.
# C.2 - Represent 3 items using hashes. Each hash should have the same keys with different values.
# C.3 - Be sure to use symbols for the keys. Try creating hashes using both types of hash symbol syntaxes. (Ruby syntax {:a => 123} vs. “JavaScript” syntax {a: 123}).
# Bonus: Read more about Ruby array and hash methods. Explore using different methods in your code.
# https://ruby-doc.org/core/Array.html
# https://ruby-doc.org/core/Hash.html
# https://ruby-doc.org/core/Symbol.html
# Bonus:
# Try to represent the same store items using a class!

# item1 = { name: "apple", color: "red", price: 1 }
# item2 = { "name" => "banana", "color" => "yellow", "price" => 1 }
# item3 = { name: "gouda", color: "yellow", price: 5 }

# puts "I just bought one #{item1[:name]} that is #{item1[:color]} and cost $#{item1[:price]}"
# puts "I just bought one #{item2["name"]} that is #{item2["color"]} and cost $#{item2["price"]}"
# puts "I just bought one #{item3[:name]} that is #{item3[:color]} and cost $#{item1[:price]}"

# class Item
#   attr_reader :name, :color, :price
#   attr_writer :name, :color, :price

#   def initialize(name, color, price)
#     @name = name
#     @color = color
#     @price = price
#   end
# end

# item4 = Item.new("watermelon", "green", 2)
# item5 = Item.new("Bicycle", "purple", 100)
# puts "I would like to purchase one " + item4.color + " " + item4.name + " priced at $" + item4.price.to_s
# puts "I would like to purchase a #{item5.color} #{item5.name} priced at $#{item5.price}."

# Rewrite your store items using a class instead of a hash. (if you haven't already!)
# a) Choose which attributes should have “reader” methods and which attributes should have “writer” methods.
# b) Create an instance from your store item class. Use puts statements to print the 3 attributes individually to the terminal.
# c) Use the attr_writer method to change a value
# Bonus: Read more about Ruby classes: https://ruby-doc.com/core/Class.html

class Item
  attr_reader :name, :color, :price
  attr_writer :name, :color

  def initialize(name, color, price)
    @name = name
    @color = color
    @price = price
  end

  def name=(name)
    @name = name
  end

  def color=(color)
    @color = color
  end

  def price=(price)
    @price = price
  end

  def print_name
    puts "This is a #{name}."
  end

  def print_color
    puts "It is #{color}"
  end

  def print_price
    puts "It costs $#{price}"
  end

  def increase_price
    @price = @price + 1
  end
end

item1 = Item.new("watermelon", "green", 2)
item1.print_name
item1.print_color
item1.print_price
item1.name = "red pepper"
item1.color = "red"
item1.print_name
item1.print_color
item1.print_price
item1.increase_price
item1.print_price
