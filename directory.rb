@students = []
# an empty array accessible to all methods

def input_vairables_into_hash(name, cohort, height)
  @students << {name: name, cohort: cohort.to_sym, height: height}
end

def input_students
  puts "Please enter the name of the student"
  puts "To go back to menu, just hit return twice"

  # get the first name
  name = STDIN.gets.strip.capitalize

  while !name.empty? && name.length<12 do
    puts "this person's height in cm?"
    height = STDIN.gets.strip.to_i
    while height==0 || !height.is_a?(Integer) do
      puts "please enter the height in cm of this student"
      height = STDIN.gets.strip.to_i
    end

    puts "which cohort?"
    cohort= STDIN.gets.strip.capitalize
    while cohort.empty? do
      puts "please enter the cohort in month of this student"
      cohort= STDIN.gets.strip.capitalize
    end

    input_vairables_into_hash(name, cohort, height)

    if @students.count==1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end


    # get another name from the user
    puts "Please enter the name of the next student or hit return to go back to menu"
    name = STDIN.gets.strip.capitalize
  end

  # no longer need to return the array of students

end

def print_header(names)
  if !names.empty?
    cohort_list=Array.new
    names.select{|n| cohort_list << n[:cohort].to_s}

    puts "Which cohort would you like to be displayed?"
    puts "Please pick a month or hit return to display all students: "
    puts cohort_list.uniq.join(" ")

    choice=STDIN.gets.strip.capitalize
    loop do
      case choice
        when ""
          puts "The students of Villains Academy"
          break
        when !cohort_list.include?(choice)
          puts "Please pick a month: "
          puts cohort_list.uniq.join(" ")
          choice=STDIN.gets.strip.capitalize
        else
          puts "The students of Villains Academy in the #{choice} cohort"
          names.select!{|n| n[:cohort]==choice.to_sym}
          break
      end
    end
  else
  puts "Thank you for your time"
  end
  puts "---------------------------------------"
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
  if names.count==1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{names.count} great students"
  end
puts "---------------------------------------"
end

# Newly added methods---------------------------------

def print_menu
  puts "Please pick one of the options by their number:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load a list from file"
  puts "9. Exit"
  puts "------End of User Menu------"
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
  when "4"
    load_students
  when "9"
    # this will cause the program to terminate
    puts "Goodbye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students(filename = "students.csv")
  puts "Hit return to save to students.csv"
  puts "Or enter another filename and return"
  new_filename=STDIN.gets.strip

  if !File.exists?(new_filename) && new_filename!=""
    puts ">>>>>> File not found! <<<<<<"
  else
    if File.exists?(new_filename)
      filename=new_filename
    else new_filename==""
    end

    # open the file for writing
    file=File.open(filename,"w")

    # file.puts "This is written to a file"
    m=0
    # iterate over the array of students
    @students.each{|s|
      student_data=[s[:name], s[:cohort]]
      csv_line=student_data.join(",")
      file.puts csv_line
      m+=1
      }
    file.close
    puts "Number of students saved: #{m}."
    puts "Total number of students: #{students.count}"

  end
  puts "---------------------------------------"
end

#To make the method load_students work with arbitrary filenames, we need to make the method more flexible by passing the filename as the argument. However, to preserve the original functionality, let's give it a default value "students.csv".
def load_students(filename = "students.csv")
  puts "Hit return to load from students.csv"
  puts "Or enter another filename and return"
  new_filename=STDIN.gets.strip

  if !File.exists?(new_filename) && new_filename!=""
    puts ">>>>>> File not found! <<<<<<"
  else
    if File.exists?(new_filename)
      filename=new_filename
    else new_filename==""
    end

    file=File.open(filename,"r")
    #Reads the entire file specified by name as individual lines, and returns those lines in an array. Lines are separated by sep
    n=0
    file.readlines.each {|line|
      #every line is an array separated with a comma
      #split the line at this comma, we get an array with two values
      #parallel assignment- assign two variables at the same time
      #every line- left to comma saved as name, right to comma saved as cohort
      name, cohort, height = line.chomp.split(',')

      #create a new hash and put it in the array of students

      input_vairables_into_hash(name, cohort, height)

      n+=1
    }
    puts "---------------------------------------"
    puts "Loaded #{n} from #{filename}.", "Total number of students: #{@students.count}"

    file.close
  end
  puts "---------------------------------------"
end
#---------------------------------

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu

    # 2. read the input and save it into a variable
    # selection = gets.strip

    # 3. do what the user has asked
    process(STDIN.gets.strip)

  end
end

#---------------------------------

def try_load_students
  filename = "students.csv"
  # filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given

  #check for file existence- functionality in the File class
  if File.exists?(filename) # if it exists
    load_students(filename)

  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

#---------------------------------
try_load_students
interactive_menu.call
#---------------------------------

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
