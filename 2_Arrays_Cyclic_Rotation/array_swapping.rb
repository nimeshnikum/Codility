require 'benchmark'

def solution(a, k)
  array_size = a.length
  return a if array_size == k

  swap_array = Array.new(array_size)

  a.each_with_index do |el, current_index|
    swap_index = (current_index + k)  % array_size
    swap_array[swap_index] = el
  end

  return swap_array
end

# a = [3, 8, 9, 7, 6]
# k = 3

# a = [0, 0, 0]
# k = 1

# a = [1, 2, 3, 4]
# k = 4

# n = rand(4..6)
# k = rand(2..5)
# a = n.times.collect { rand(-1000..1000) }

n = rand(90..100)
k = rand(90..100)
a = n.times.collect { rand(-1000..1000) }

Benchmark.bm do |x|
  x.report { print solution(a, k) }
end
