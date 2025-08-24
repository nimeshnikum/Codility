require 'benchmark'

def solution(n)
  binary_string = n.to_s(2)
  binary_string = binary_string.squeeze('1')

  chars = binary_string.split('1')
  chars.pop unless binary_string.end_with?('1')
  chars.empty? ? 0 : chars.max.length
end

# n = 20
# n = 529
# n = 561892
# n = 805306373
# n = 1376796946
# n = 2147483647
n = rand(214748364..2147483647)
Benchmark.bm do |x|
  x.report { puts solution(n) }
end
puts solution(n)
