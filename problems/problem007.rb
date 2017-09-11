require_relative 'euler_problem'
require 'prime'

class Problem007 < EulerProblem
  N = 10001

  def self.solve!
    super do
      Prime.take(N).last
    end
  end
end

Problem007.solve!