require_relative 'lib/database_connection'
require_relative 'lib/cohort_repository'


DatabaseConnection.connect('student_directory_2_test')

repo = CohortRepository.new
cohort = repo.find_with_students(2)

puts "#{cohort.name} cohort starts on #{cohort.starting_date}."
cohort.students.each do |student|
    puts student.name
end