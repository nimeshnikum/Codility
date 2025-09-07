require 'benchmark'

def solution(a)
  # difference = 0
  #
  # while (a.length > 0) do
  #   if difference >= 0
  #     puts b = a.pop
  #     difference -= b.abs
  #   else
  #     puts c = a.shift
  #     difference += c.abs
  #   end
  #   print a
  #   puts difference
  # end
  # difference.abs

  left = a.shift
  right = a.pop
  print a

  while (a.length > 1) do
    if (left <= right) && (left - right >= 0)
      puts b = a.shift
      left += b
    else
      puts c = a.pop
      right += c
    end
    print a
    puts ''
    puts left
    puts right
    puts left - right
  end
  last_el = a.last
  puts last_el
  left_option = (left + last_el) - right
  right_option = left - (last_el + right)
  puts left_option
  puts right_option
  [left_option.abs, right_option.abs].min
end

a = [3,1,2,4,3] # 1
a = [3,1,2,4,3,5] # TODO
# a = [3,4,2,1,3]
# a = [-3,4,2,-1,6,-5]
# a = [-3,-4,2,-1,6,-5] # -1
# a = [-9, -8, -6, -5, -3, 1, -2, 4] # -6

Benchmark.bm do |x|
  x.report { puts solution(a) }
end
