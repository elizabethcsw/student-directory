@students = []
# an empty array accessible to all methods

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  # get the first name
  name = gets.strip.capitalize

  while !name.empty? && name.length<12 do
    puts "this person's height in cm?"
    height = gets.strip.to_i
    while height==0 || !height.is_a?(Integer) do
      puts "please enter the height in cm of this student"
      height = gets.strip.to_i
    end

    puts "which cohort?"
    cohort= gets.strip.capitalize
    while cohort.empty? do
      puts "please enter the cohort in month of this student"
      cohort= gets.strip.capitalize
    end

    @students << {name: name, cohort: cohort, height: height}

    if @students.count==1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end


    # get another name from the user
    puts "Please enter the name of the next student or hit return to finish"
    name = gets.strip.capitalize
  end

  # no longer need to return the array of students

end

def print_header(names)
  if !names.empty?
    cohort_list=Array.new
    names.select{|n| cohort_list << n[:cohort].to_s}

    puts "Which cohort would you like to be displayed?"
    puts "Please pick a month: "
    puts cohort_list.uniq.join(" ")

    choice=gets.strip.capitalize
    while choice.empty? || !cohort_list.include?(choice) do
      puts "Please pick a month: "
      puts cohort_list.uniq.join(" ")
      choice=gets.strip.capitalize
    end
    puts "The students of Villains Academy in the #{choice} cohort"
    puts "-------------"
    names.select!{|n| n[:cohort]==choice}
  else
  puts "Thank you for your time"
  end
end

def print_students_list(names)
  i=0
  while i<=names.length-1 do
    puts "#{i+1}. #{names[i][:name]} #{names[i][:height]}cm (#{names[i][:cohort]} cohort)".ljust(2)
    i+=1
  end
  names
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
  puts "-------------"
end

# Newly added methods---------------------------------

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header(@students)
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    # this will cause the program to terminate
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  # open the file for writing
  file=File.open("students.csv","w")

  file.puts "This is written to a file"
  
  # iterate over the array of students
  @students.each{|s|
    student_data=[s[:name], s[:cohort]]
    csv_line=student_data.join(",")
    file.puts csv_line
    }
  file.close
end

#---------------------------------

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu

    # 2. read the input and save it into a variable
    # selection = gets.strip

    # 3. do what the user has asked
    process(gets.strip)

  end
end

interactive_menu.call

=begin
names=[{:name=>"eli", :cohort=>:dec, :height=>89}, {:name=>"kate", :cohort=>:dec, :height=>39}, {:name=>"mary", :cohort=>:jul, :height=>79}]
i=0
while i<=names.length-1 do
  puts "#{i+1}. #{names[i][:height]}cm"
  i+=1
end

array1.each{|n| puts "#{n[:height]}"}
  p names
end

=end


=begin
[:jan, :dec, :apr].each {|co| print "#{co.to_s} "}
=end


=begin
students = input_students
print_header(students)
print(students)
print_footer(students)
=end
