require_relative 'euler_problem'

class Problem001 < EulerProblem
  def self.solve!
    super do
      n = 1000

      (1...n).reduce(0) { |s, i| (i%3==0 || i%5==0) ? s+i : s }
    end
  end
end

Problem001.solve!
