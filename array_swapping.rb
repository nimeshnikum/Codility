# An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
#
# The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
#
# Write a function:
#
# def solution(a, k)
#
# that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
#
# For example, given
#
#     A = [3, 8, 9, 7, 6]
#     K = 3
# the function should return [9, 7, 6, 3, 8]. Three rotations were made:
#
#     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
#     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
#     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
# For another example, given
#
#     A = [0, 0, 0]
#     K = 1
# the function should return [0, 0, 0]
#
# Given
#
#     A = [1, 2, 3, 4]
#     K = 4
# the function should return [1, 2, 3, 4]
#
# Assume that:
#
# N and K are integers within the range [0..100];
# each element of array A is an integer within the range [−1,000..1,000].
# In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
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
