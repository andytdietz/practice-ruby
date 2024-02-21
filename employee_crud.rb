require "sqlite3"           # loads sqlite3
require "tty-table"         # loads tty-table

db = SQLite3::Database.open "employee.db"     # opens employee db  SQLite file, or creates one if it doesn't exist
db.execute "CREATE TABLE IF NOT EXISTS employees(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, salary INTEGER, active INTEGER)"              # Creates a table with keys first name, laste name, salary, and if they're active

while true # run while true
  system "clear"                                                  # clears the system from the previous inputs
  results = db.query "SELECT * FROM employees"                    # creates variable 'results' that contains employees info
  header = ["id", "first_name", "last_name", "salary", "active"]  # creates headers for the tables
  rows = results.to_a
  table = TTY::Table.new header, rows                       # creates the table with headers and rows
  puts "EMPLOYEES (#{rows.length} total)"                   # prints employees to the screen with the total number of entries
  puts table.render(:unicode)                               #
  puts                                                      # puts nothing to the screen as a space between
  print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "        # prints to the screen
  input_choice = gets.chomp.downcase                        # creates a variable called input_choice contains the users input in lowercase
  if input_choice == "c" # if the user chooses 'c', run the code below to create new data
    print "First name: "                                    # prints first name to the screen
    input_first_name = gets.chomp                           # creates a variable called input_first_name that contains users input
    print "Last name: "                                     # prints last name to the screen
    input_last_name = gets.chomp                            # creates a variable called input_last_name that contains users input
    print "Salary: "                                        # prints salary to the screen
    input_salary = gets.chomp.to_i                          # creates a variable called salary that contains users input
    db.execute "INSERT INTO employees (first_name, last_name, salary, active) VALUES (?, ?, ?, ?)",
               input_first_name, input_last_name, input_salary, 1 # runs command to insert employee data into table with these values provided
  elsif input_choice == "r" # if user chooses 'r', which allows user to read data
    print "Employee id: "                 # prints employee id to the screen
    input_id = gets.chomp.to_i            # creates a variable called input_id that contains users input
    results = db.query "SELECT * FROM employees WHERE id = ?", input_id # results is equal to the employee data that matches the input_id
    first_result = results.next           # the variable first_result is equal to the next row
    puts "Id: #{first_result[0]}"         # prints first results ID
    puts "First name: #{first_result[1]}" # prints first results first name
    puts "Last name: #{first_result[2]}"  # pritns first results last name
    puts "Salary: #{first_result[3]}"     # prints first results salary
    puts "Active: #{first_result[4]}"     # prints first results active status
    puts                                  # puts nothing to the screen as a space between
    print "Press enter to continue"       # prints to the screen
    gets.chomp                            #
  elsif input_choice == "u"
    print "Employee id: "
    input_id = gets.chomp.to_i
    print "Update active status (true or false): "
    input_active = gets.chomp
    if input_active == "true"
      input_active = 1
    else
      input_active = 0
    end
    db.execute "UPDATE employees SET active = ? WHERE id = ?", input_active, input_id
  elsif input_choice == "d"
    puts "Delete employee"
    print "Enter employee id: "
    input_id = gets.chomp.to_i
    db.execute "DELETE FROM employees WHERE id = ?", input_id
  elsif input_choice == "q"
    system "clear"
    puts "Goodbye!"
    return
  else
    puts "Invalid choice"
    print "Press enter to continue"
    gets.chomp
  end
end
