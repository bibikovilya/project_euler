require_relative 'euler_problem'

class Problem009 < EulerProblem
  SUM = 1000

  def self.solve!
    super do
      res = nil

      (3...(SUM-3)/3).each do |a|
        break if res

        ((a+1)...(SUM-a)/2).each do |b|
          c = SUM-a-b

          if a**2 + b**2 == c**2
            res = a*b*c
            break
          end
        end
      end
      res
    end
  end
end

Problem009.solve!
