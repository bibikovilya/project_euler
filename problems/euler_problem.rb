require_relative '../config/initialize'
require 'benchmark'

class EulerProblem
  class << self
    def description
      puts "\e[34m#{'='*100}\e[0m"
      puts "\e[36m\e[1mProblem #{number}\e[22m\e[0m\n"
      puts "\e[34m#{'-'*100}\e[0m"
      puts DESCRIPTIONS[number]
      puts "\e[34m#{'-'*100}\e[0m"
      puts "Link - https://projecteuler.net/problem=#{number}"
    end

    def solve!(&block)
      self.description

      puts "\e[34m#{'-'*100}\e[0m"

      formatted_output('Your', &block)
    end

    def euler!(&block)
      formatted_output('Euler', &block)
    end

    def answer
      ANSWERS[number]
    end

    private

    def number
      self.name[/\d+/].to_i
    end

    def formatted_output(version)
      bench = Benchmark.measure do
        result = yield if block_given?

        puts "\e[1m#{version} version:\e[22m"

        if result == answer
          puts "\e[32mCongratulations, the answer you gave to problem #{number} is correct. Answer: \e[1m#{result}\e[22m\e[0m"
        else
          puts "\e[31mSorry, but the answer you gave appears to be incorrect. Answer: \e[1m#{result}\e[22m\e[0m"
        end
      end
      puts "\e[35m\e[1mBenchmark:\e[22m"
      printf("\e[35m%10s%11s%11s%12s\n", 'user', 'system', 'total', 'real')
      puts bench.format
      puts "\e[0m\e[34m#{'='*100}\e[0m"
    end
  end
end
