require 'benchmark'

def solution(a)
  n = a.length
  return 0 unless a.all? { |x| x.between?(1, n) }
  return 1 if a.uniq.length == n
  0
end

inputs = [
  [4, 1, 3, 2],     # permutation, should return 1
  [4, 1, 3],        # not a permutation, should return 0
  [1],              # permutation, should return 1
  [2, 2, 2],        # not a permutation, should return 0
  (1..100_000).to_a,  # large permutation, should return 1
  [1] * 100_000      # large non-permutation, should return 0
]

inputs.each do |input|
  puts "Input size: #{input.size}, Output: #{solution(input)}"
end

Benchmark.bm(10) do |x|
  inputs.each do |input|
    x.report("Size #{input.size}") { solution(input) }
  end
end
