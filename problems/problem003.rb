require_relative 'euler_problem'
require 'prime'

class Problem003 < EulerProblem
  def self.solve!
    super do
      n = 600851475143
      Prime.prime_division(n).last.first
    end
  end
end

Problem003.solve!