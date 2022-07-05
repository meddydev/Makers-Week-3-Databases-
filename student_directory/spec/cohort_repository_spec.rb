require "cohort_repository"

describe CohortRepository do
    def reset_all_tables
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_2_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_all_tables
    end

    it "finds a cohort and its associated students" do
        repo = CohortRepository.new
        cohort = repo.find_with_students(2)

        expect(cohort.starting_date).to eq '2022-06-01'
        expect(cohort.name).to eq 'June 2022'
        expect(cohort.students.length).to eq 2
        expect(cohort.students.first.name).to eq 'David'
    end
end
