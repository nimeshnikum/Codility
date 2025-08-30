require 'benchmark'

def solution(x, y, d)
  diff = y - x
  return 0 if diff == 0

  jumps = diff / d
  jumps += 1 if diff % d > 0

  return jumps
end

# x = 10
# y = 85
# d = 30

# x = 10
# y = 70
# d = 30

# x = 50
# y = 50
# d = 30

# x = 20
# y = 40
# d = 30

x = rand(999..4000)
y = rand(4000..9999)
d = rand(20..999)

# x = rand(1..1000000000)
# y = rand(1..1000000000)
# d = rand(1..1000000000)

Benchmark.bm do |b|
  b.report { puts solution(x, y, d) }
end
