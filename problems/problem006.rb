require_relative 'euler_problem'

class Problem006 < EulerProblem
  LIMIT = 100

  def self.solve!
    super do
      (1..LIMIT).reduce(:+)**2 - (1..LIMIT).reduce { |s, i| s+i**2 }
    end
  end

  def self.euler!
    super do
      (LIMIT*(LIMIT+1)/2)**2 - (2*LIMIT+1)*(LIMIT+1)*LIMIT/6
    end
  end
end

Problem006.solve!
Problem006.euler!