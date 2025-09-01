# A non-empty array A consisting of N integers is given.
#
# A permutation is a sequence containing each element from 1 to N once, and only once.
#
# For example, array A such that:
#
#     A[0] = 4
#     A[1] = 1
#     A[2] = 3
#     A[3] = 2
# is a permutation, but array A such that:
#
#     A[0] = 4
#     A[1] = 1
#     A[2] = 3
# is not a permutation, because value 2 is missing.
#
# The goal is to check whether array A is a permutation.
#
# Write a function:
#
# def solution(a)
#
# that, given an array A, returns 1 if array A is a permutation and 0 if it is not.
#
# For example, given array A such that:
#
#     A[0] = 4
#     A[1] = 1
#     A[2] = 3
#     A[3] = 2
# the function should return 1.
#
# Given array A such that:
#
#     A[0] = 4
#     A[1] = 1
#     A[2] = 3
# the function should return 0.
#
# Write an efficient algorithm for the following assumptions:
#
# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [1..1,000,000,000].
require 'benchmark'

def solution(a)
  mapping = Hash[a.collect { |i| [i, true] }]

  (1..a.length).each do |i|
    unless mapping.key?(i)
      return 0
    end
  end

  return 1
end

# a = [4,1,3,2]
# a = [4,1,3]

# a = 3.times.collect { rand(1..1000000000) }
# a = 50.times.collect { rand(1..1000000000) }

# n = rand(99995..100000)
# a = n.times.collect { rand(1..1000000000) }
# a = n.times.collect { rand(999999994..1000000000) }
# a = n.times.collect { |i| i }
# a = 40000.times.collect { |i| i + 1 } # (1..40000)
a = 100000.times.collect { |i| i + 1 } # (1..100000)

b = a.shuffle

Benchmark.bm do |x|
  x.report { puts solution(a) }
  x.report { puts solution(b) }
end
