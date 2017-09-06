require_relative '../config/initialize'

class EulerProblem
  class << self
    def description
      puts "\e[36m\e[1mProblem #{number}\e[22m\e[0m\n"
      puts "\e[34m#{'-'*100}\e[0m"
      puts DESCRIPTIONS[number]
      puts "\e[34m#{'-'*100}\e[0m"
      puts "Link - https://projecteuler.net/problem=#{number}"
    end

    def solve!
      puts "\e[34m#{'='*100}\e[0m"

      self.description

      result = yield if block_given?

      puts "\e[34m#{'-'*100}\e[0m"

      if result == answer
        puts "\e[32mCongratulations, the answer you gave to problem #{number} is correct. Answer: \e[1m#{result}\e[22m\e[0m"
      else
        puts "\e[31mSorry, but the answer you gave appears to be incorrect.\e[0m"
      end
      puts "\e[34m#{'='*100}\e[0m"
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
