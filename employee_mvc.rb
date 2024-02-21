require "sqlite3"     # loads sqlite3
require "tty-table"   # loads tty-table

class Employee # creates a class named Employee
  @@db = SQLite3::Database.open "employee.db"  # open employee.db file, if it exists
  @@db.execute "CREATE TABLE IF NOT EXISTS employees(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT, salary INTEGER, active INTEGER)" # if it doesn't exist, create it

  attr_reader :id, :first_name, :last_name, :active, :salary # user can read id, firstname, last name, active, salary
  attr_writer :active   # user can write/change active status

  def initialize(input_options) # initializes class variables
    @id = input_options[:id]                  # assigns value associated with :id to @id
    @first_name = input_options[:first_name]  # assigns value associated with :first_name to @first_name
    @last_name = input_options[:last_name]    # assigns value associated with :last_name to @last_name
    @salary = input_options[:salary]          # assigns value associated with :salary to @salary
    @active = input_options[:active]          # assigns value associated with :active to @active
  end

  def self.create(options) # creates a method to create a new employee in the database
    @@db.execute "INSERT INTO employees (first_name, last_name, salary, active) VALUES (?, ?, ?, ?)", # values to be inserted into database
                 options[:first_name], options[:last_name], options[:salary], options[:active]
  end

  def self.all # creates a method to retrieve employee records and add them to the table
    results = @@db.query "SELECT * FROM employees" # selects all employees
    results.map do |row| # maps each result to a new row
      Employee.new(id: row[0], first_name: row[1], last_name: row[2], salary: row[3], active: row[4]) # maps each new employee to the corresponding row
    end
  end

  def self.find_by(options) # creates a method to find employee by ID
    results = @@db.query "SELECT * FROM employees WHERE id = ?", options[:id] # results will be equal to the employee id
    first_result = results.next # first_result is the next result in the database
    Employee.new(id: first_result[0], first_name: first_result[1], last_name: first_result[2], salary: first_result[3], active: first_result[4]) # uses first_result to retrieve employee data and creates a new employee with data from result
  end

  def update(options) # creates a method to update an employee record
    if options[:active] == "true" # if active status is true, run code below
      active = 1                      # active = 1 (is active)
    else # if active status is false
      active = 0                      # active = 0 (inactive)
    end
    @@db.execute "UPDATE employees SET active = ? WHERE id = ?", active, self.id   # updates employee active status to new value
  end

  def destroy # creates a method to delete an employee record
    @@db.execute "DELETE FROM employees WHERE id = ?", self.id  # executes 'delete', deleting row from table of corresponding ID
  end
end

class View # creates View class
  def self.display_employees(employees) # creates method to create table to display employee information
    header = ["id", "first_name", "last_name", "salary", "active"] # creates headers with values id, first_name, last_name, salary, active
    rows = employees.map { |employee| [employee.id, employee.first_name, employee.last_name, employee.salary, employee.active] }
    table = TTY::Table.new header, rows
    puts "EMPLOYEES (#{rows.length} total)"
    puts table.render(:unicode)
    puts
  end

  def self.display_employee(employee)
    puts "Id: #{employee.id}"
    puts "First name: #{employee.first_name}"
    puts "Last name: #{employee.last_name}"
    puts "Salary: #{employee.salary}"
    puts "Active: #{employee.active}"
    puts
    print "Press enter to continue"
    gets.chomp
  end

  def self.display_exit_screen
    system "clear"
    puts "Goodbye!"
  end

  def self.display_error_screen
    puts "Invalid choice"
    print "Press enter to continue"
    gets.chomp
  end

  def self.get_menu_option
    print "[C]reate [R]ead [U]pdate [D]elete [Q]uit: "
    gets.chomp.downcase
  end

  def self.get_create_options
    print "First name: "
    input_first_name = gets.chomp
    print "Last name: "
    input_last_name = gets.chomp
    print "Salary: "
    input_salary = gets.chomp.to_i
    { first_name: input_first_name, last_name: input_last_name, salary: input_salary, active: 1 }
  end

  def self.get_read_options
    print "Employee id: "
    input_id = gets.chomp.to_i
    { id: input_id }
  end

  def self.get_update_options
    print "Employee id: "
    input_id = gets.chomp.to_i
    print "Update active status (true or false): "
    input_active = gets.chomp
    { id: input_id, active: input_active }
  end

  def self.get_destroy_options
    puts "Delete employee"
    print "Enter employee id: "
    input_id = gets.chomp.to_i
    { id: input_id }
  end
end

class Controller
  def self.run
    while true
      system "clear"
      employees = Employee.all
      View.display_employees(employees)
      input_choice = View.get_menu_option
      if input_choice == "c"
        input_options = View.get_create_options
        Employee.create(input_options)
      elsif input_choice == "r"
        input_options = View.get_read_options
        employee = Employee.find_by(input_options)
        View.display_employee(employee)
      elsif input_choice == "u"
        input_options = View.get_update_options
        employee = Employee.find_by(id: input_options[:id])
        employee.update(input_options)
      elsif input_choice == "d"
        input_options = View.get_destroy_options
        employee = Employee.find_by(input_options)
        employee.destroy
      elsif input_choice == "q"
        View.display_exit_screen
        return
      else
        View.display_error_screen
      end
    end
  end
end

Controller.run
