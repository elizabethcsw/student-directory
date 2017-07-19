#hash in array
=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []

  # get the first name
  name = gets.chomp

  while !name.empty? && name.length<12 do
    puts "this person's height in cm?"
    height = gets.chomp.to_i
    while height==0 || !height.is_a?(Integer) do
      puts "please enter the height in cm of this student"
      height = gets.chomp.to_i
    end

    puts "which cohort?"
    cohort= gets.chomp.intern
    while cohort.empty? do
      puts "please enter the cohort in month of this student"
      cohort= gets.chomp.intern
    end

    students << {name: name, cohort: cohort, height: height}
    puts "Now we have #{students.count} students"

    # get another name from the user
    puts "Please enter the name of the next student"
    name = gets.chomp
  end

  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  i=0
  while i<=names.length-1 do
    puts "#{i+1}. #{names[i][:name]} #{names[i][:height]}cm (#{names[i][:cohort]} cohort)".ljust(2)
    i+=1
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
