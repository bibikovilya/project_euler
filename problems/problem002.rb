require_relative 'euler_problem'

class Problem002 < EulerProblem
  def self.solve!
    super do
      max = 4_000_000

      cur = 1
      pre = 1
      sum = 0

      while cur < max
        pre, cur = cur + pre, pre
        sum += cur if cur%2==0
      end

      sum
    end
  end
end

Problem002.solve!