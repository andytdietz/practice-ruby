# Exercise:
# A. Use the terminal to create a new folder in your Actualize folder called `practice-ruby`.
# B. Create a new file in the folder called `store_item.rb` and open it in your text editor.
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

# Create a program that asks the user for their favorite 5 foods. Then display those foods as an array, using the p keyword.

# foods = []
# puts "Enter 5 foods: "
# while foods.length < 5
#   foods.push(gets.chomp)
# end

# # Now, instead of printing out the array, output 5 separate lines of each food, with the prefix, “I love”. For example:

# index = 0
# while index < foods.length
#   food = foods[index]
#   puts "I love " + food
#   index = index + 1
# end

# # Finally, change your program so that when the list is printed in the terminal, each food is prefaced with a number, beginning with 1 and going up to 5, for example:

# number = 1
# index = 0
# while number <= 5
#   food = foods[index]
#   puts number.to_s + ". " + food
#   index = index + 1
#   number = number + 1
# end

# Create and define a variable count = 0. Using a loop and the += operator, output the following:

# count = 0
# while count < 10
#   puts count += 1
# end

# Translate the following into ruby code. Run the program to make sure it works:
# Sam enjoys cooking. Make an array with recipe names to represent the different recipes Sam can cook.
# recipes = ["mac n cheese", "hamburgers", "chicken tenders", "crepes", "b", "c", "d", "e", "f", "g", "h"]
# pp recipes
# puts "Sam likes to cook #{recipes[0]}, #{recipes[1]}, and #{recipes[2]}"

# # Sally speaks many languages. Make an array with language names to represent the languages Sally can speak.
# languages = ["English", "Spanish", "French", "German", "French-Canadian", "Italian"]
# pp languages
# puts "Sally can speak #{languages[0]}, #{languages[1]}, #{languages[2]}"

# # If Sam can cook more than 10 recipes and Sally speaks more than 5 languages, they should date. Based on the above arrays, print out a message describing whether or not they should date.
# if recipes.length > 10 && languages.length > 5
#   puts "They should date!"
# else
#   puts "they should not date"
# end

# # If Sam can make crepes or Sally can speak French, they should marry. Based on the above arrays, print out a message describing whether or not they should marry.
# if recipes.include?("Crepes".downcase) || languages.include?("French")
#   puts "They should marry!"
# else
#   puts "They should breakup"
# end

# Create a banking program that asks the user 5 times to enter a first name, last name, and email. This information should be stored as an array of hashes.
information = []
index = 0
person = {}
while index < 2
  puts "Enter first name"
  fname = gets.chomp
  person["first_name"] = fname
  puts "Enter last name"
  lname = gets.chomp
  person["last_name"] = lname
  puts "Enter email"
  email = gets.chomp
  person["email"] = email
  information.push(person)
  index = index + 1
end
pp information
