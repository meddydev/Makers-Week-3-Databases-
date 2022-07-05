class Cohort
  attr_accessor :id, :starting_date, :name, :students

  def initialize
    @students = []
  end
end
