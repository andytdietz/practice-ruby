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

item1 = { name: "apple", color: "red", price: 1 }
item2 = { "name" => "banana", "color" => "yellow", "price" => 1 }
item3 = { name: "gouda", color: "yellow", price: 5 }

puts "I just bought one #{item1[:name]} that is #{item1[:color]} and cost $#{item1[:price]}"
puts "I just bought one #{item2["name"]} that is #{item2["color"]} and cost $#{item2["price"]}"
puts "I just bought one #{item3[:name]} that is #{item3[:color]} and cost $#{item1[:price]}"

class Item
  attr_reader :name, :color, :price
  attr_writer :name, :color, :price

  def initialize(name, color, price)
    @name = name
    @color = color
    @price = price
  end
end

item4 = Item.new("watermelon", "green", 2)
item5 = Item.new("Bicycle", "purple", 100)
puts "I would like to purchase one " + item4.color + " " + item4.name + " priced at $" + item4.price.to_s
puts "I would like to purchase a #{item5.color} #{item5.name} priced at $#{item5.price}."
