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
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []

  # get the first name
  name = gets.chomp

  puts "this person's height in cm?"
  height = gets.chomp

  puts "which cohort?"
  cohort= gets.chomp.intern


  # while the name is not empty and char less than 12, repeat this code
  while !name.empty? do
    if name.length<12
      # add the student hash to the array
      students << {name: name, cohort: cohort, height: height}
    else
    end

    puts "Now we have #{students.count} students"

    # get another name from the user
    puts "Please enter the names of the students"
    name = gets.chomp

    #break if the user stops answering
    break if name.empty?

    #ask for the mext person's height if he answered the name just now
    puts "this person's height in cm?"
    height = gets.chomp

    puts "which cohort?"
    cohort= gets.chomp.intern

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
