require_relative 'euler_problem'
require 'prime'

class Problem010 < EulerProblem
  TO = 2_000_000

  def self.solve!
    super do
      # ------------------------------------------------------------------------
      # total: ~3.65s
      # ------------------------------------------------------------------------
      # Prime.take_while { |n| n < TO }.reduce(:+)

      # ------------------------------------------------------------------------
      # total: ~18.17s
      # ------------------------------------------------------------------------
      # (2..TO).select do |n|
      #   (2..Math.sqrt(n).to_i).all? { |d| n % d != 0 }
      # end.reduce(:+)

      # ------------------------------------------------------------------------
      # total: ~3.3s
      # ------------------------------------------------------------------------
      # (2..TO).select do |n|
      #   is_prime?(n)
      # end.reduce(:+)

      # ------------------------------------------------------------------------
      # total: too much
      # ------------------------------------------------------------------------
      # primes = (2..TO).to_a
      # (2..Math.sqrt(TO).to_i).each do |n|
      #   primes.reject! { |i| i != n && i % n ==0 }
      # end
      # primes.reduce(:+)

      # ------------------------------------------------------------------------
      # My implementation of Sieve of Eratosthenes
      # total: ~30s
      # ------------------------------------------------------------------------
      # primes = (2..TO).to_a
      # (2..Math.sqrt(TO).to_i).each do |n|
      #   primes = primes - Array.new(TO/n-n+1){ |i| n*n + i*n }
      # end
      # primes.reduce(:+)
    end
  end

  def self.is_prime?(n)
    return false if n <= 1
    return true  if n <= 3
    return false if n % 2 == 0 || n % 3 == 0

    i = 5
    while i * i <= n
      return false if n % i == 0 || n % (i + 2) == 0
      i += 6
    end
    return true
  end

  def self.euler!
    super do
      # The natural looping algorithm
      # total: ~3.09s
      # sum = 5
      # n = 5
      #
      # while n <= TO
      #   sum += n if is_prime?(n)
      #   n += 2
      #   sum += n if n <= TO && is_prime?(n)
      #   n += 4
      # end
      # sum

      # ------------------------------------------------------------------------
      # First implementation The sieve of Eratosthenes
      # total: ~0.4s
      # ------------------------------------------------------------------------
      # crosslimit = Math.sqrt(TO).to_i
      # sieve = Array.new(TO-1){false}
      # sieve[0] = true
      #
      # n = 4
      # while n < TO
      #   sieve[n-1] = true
      #   n += 2
      # end
      #
      # n = 3
      # while n <= crosslimit
      #   unless sieve[n-1]
      #     m = n * n
      #     while m < TO
      #       sieve[m-1] = true
      #       m += 2*n
      #     end
      #   end
      #   n += 2
      # end
      #
      # sum = 0
      # n = 2
      # while n < TO
      #   sum += n unless sieve[n-1]
      #   n += 1
      # end
      # sum

      # ------------------------------------------------------------------------
      # Optimising The sieve of Eratosthenes
      # total: ~0.27s
      # ------------------------------------------------------------------------
      sievebound = (TO-1)/2
      sieve = Array.new(sievebound){false}
      crosslimit = (Math.sqrt(TO).to_i - 1) / 2

      i = 1
      while i < crosslimit
        unless sieve[i-1]
          j = 2*i*(i+1)
          while j < sievebound
            sieve[j-1] = true
            j += 2*i+1
          end
        end
        i += 1
      end

      sum = 2
      i = 1
      while i < sievebound
        sum += 2*i+1 unless sieve[i-1]
        i += 1
      end
      sum
    end
  end
end

Problem010.solve!
Problem010.euler!
