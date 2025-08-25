require 'benchmark'

def solution(a)
  mapping = Hash.new(0)

  # group elements by occurrances
  a.each { |i| mapping[i] += 1 }

  # find the number having odd occurance and return it
  mapping.select { |k,v| v % 2 == 1 }.keys.first
end

# a = [9, 3, 9, 3, 9, 7, 9]
a = []

# n = 9
# ((n-1)/2).times { |i| k = rand(1..10); a << k; a << k }
# a << rand(1..10)
# b = a.shuffle

# n = 999999
# ((n-1)/2).times { |i| k = rand(1..1000000000); a << k; a << k }
# a << rand(1..1000000000)
# b = a.shuffle

Benchmark.bm do |x|
  x.report { print solution(a) }
  x.report { puts solution(b) }
end
