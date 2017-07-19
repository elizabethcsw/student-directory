
def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []

  # get the first name
  name = gets.chomp.capitalize

  while !name.empty? && name.length<12 do
    puts "this person's height in cm?"
    height = gets.chomp.to_i
    while height==0 || !height.is_a?(Integer) do
      puts "please enter the height in cm of this student"
      height = gets.chomp.to_i
    end

    puts "which cohort?"
    cohort= gets.chomp.capitalize
    while cohort.empty? do
      puts "please enter the cohort in month of this student"
      cohort= gets.chomp.capitalize
    end

    students << {name: name, cohort: cohort, height: height}
    
    if students.count==1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end


    # get another name from the user
    puts "Please enter the name of the next student or hit return to finish"
    name = gets.chomp.capitalize
  end

  # return the array of students
  students
end

def print_header(names)
  p names
  cohort_list=Array.new
  names.select{|n| cohort_list << n[:cohort].to_s}
  p cohort_list

  puts "Which cohort would you like to be displayed?"
  puts "Please pick a month: "
  puts cohort_list.uniq.join(" ")

  choice=gets.chomp.capitalize
  while choice.empty? || !cohort_list.include?(choice) do
    puts "Please pick a month: "
    puts cohort_list.uniq.join(" ")
    choice=gets.chomp.capitalize
  end
  puts "The students of Villains Academy in the #{choice} cohort"
  puts "-------------"
  names.select!{|n| n[:cohort]==choice}
puts "end"
end

=begin
[:jan, :dec, :apr].each {|co| print "#{co.to_s} "}
=end

def print(names)
  i=0
  while i<=names.length-1 do
    puts "#{i+1}. #{names[i][:name]} #{names[i][:height]}cm (#{names[i][:cohort]} cohort)".ljust(2)
    i+=1
  end
  names
end


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


def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header(students)
print(students)
print_footer(students)




#---------------------------------



#---------------------------------
