require 'benchmark'

def solution(x, a)
  mapping = Hash.new
  max = 0

  a.each_with_index do |el, idx|
    mapping[el] ||= idx
  end

  (1..x).each do |p|
    unless mapping.key?(p)
      return -1
    end

    if mapping[p] > max
      max = mapping[p]
    end
  end

  max
end

# x = 5
# a = [1,3,1,4,2,3,5,4]
# a = [1,3,1,5,2,3,4,4]

# n = rand(1..100000)
# x = rand(1..10)
# a = n.times.collect { rand(1..x) }

n = rand(99995..100000)
x = rand(50..100)
# x = rand(995..1000)
a = n.times.collect { rand(1..x) }

Benchmark.bm do |b|
  b.report { puts solution(x, a) }
end
