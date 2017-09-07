require_relative 'euler_problem'

class Problem004 < EulerProblem
  def self.solve!
    super do
      digit_number = 3

      min = 10**(digit_number-1)
      max = 10**digit_number-1
      
      cur = max*max

      while cur > min*min
        if cur.to_s == cur.to_s.reverse
          d1 = (1..max).to_a.reverse.find { |i| cur%i == 0 }
          d2 = cur/d1
          break if d1.to_s.size == digit_number && d2.to_s.size == digit_number
        end

        cur -= 1
      end

      cur
    end
  end
end

Problem004.solve!