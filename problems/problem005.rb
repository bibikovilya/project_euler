require_relative 'euler_problem'
require 'prime'

class Problem005 < EulerProblem
  def self.solve!
    super do
      to = 20

      divs = ((to/2+1)..to).to_a
      max = divs.reduce(:*)
      step = to
      cur = step

      while cur < max
        break if divs.all? { |i| cur%i == 0 }
        cur += step
      end

      cur
    end
  end

  def self.euler!
    super do
      k = 20
      p = Prime.take_while {|p| p <= k }

      n = 1
      p.each do |pi|
        n *= pi**(Math.log10(k) / Math.log10(pi)).floor
      end

      n
    end
  end
end

Problem005.solve!
Problem005.euler!