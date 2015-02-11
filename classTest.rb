class Student
	attr_accessor :first_name, :last_name, :primary_phone_number

	def introduction
		puts "Hi, I'm #{first_name}!"
	end
end

puts 'How many students in class?'
student_number = gets.chomp.to_i
name_input = []
first_names = []
second_names = []

student_number.times do |x|
	puts 'Please type a student\'s name (first and last).'
	name_input = gets.chomp.split(' ')
	puts name_input
	first_names[x] = name_input[0]
	second_names[x] = name_input[1]
end

puts first_names
puts second_names
