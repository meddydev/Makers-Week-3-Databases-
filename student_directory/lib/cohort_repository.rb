require_relative "./cohort"
require_relative "./student"

class CohortRepository
  # Selecting one cohort with associated students
  # cohort_id passed as argument
  def find_with_students(cohort_id)
    query = 'SELECT cohorts.id AS cohort_id, cohorts.starting_date, cohorts.name AS cohort_name,
    students.id AS student_id, students.name AS student_name
    FROM cohorts
    JOIN students
    ON cohorts.id = students.cohort_id
    WHERE cohorts.id = $1;'
    params = [cohort_id]

    result_set = DatabaseConnection.exec_params(query, params)
    first_record = result_set[0]

    cohort = Cohort.new
    cohort.id = first_record["cohort_id"]
    cohort.starting_date = first_record["starting_date"]
    cohort.name = first_record["cohort_name"]

    result_set.each do |record|
        student = Student.new
        student.id = record["student_id"]
        student.name = record["student_name"]
        cohort.students << student
    end

    cohort


    # Returns a Cohort object with 'students' method that returns an array of students associated with the cohort
  end
end
