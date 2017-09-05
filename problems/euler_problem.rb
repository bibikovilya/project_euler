require_relative '../config/initialize'

class EulerProblem
  class << self
    def description
      puts '='*100
      puts "Problem #{number}\n"
      puts '-'*100
      puts DESCRIPTIONS[number]
      puts '='*100
    end

    def solve!
      self.description

      result = yield if block_given?

      if result == answer
        puts 'Right!'
      else
        puts 'Sorry, but the answer you gave appears to be incorrect.'
      end
    end

    def answer
      ANSWERS[number]
    end

    private

    def number
      self.name[/\d+/].to_i
    end
  end
end
