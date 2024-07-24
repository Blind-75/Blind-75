// https://leetcode.com/problems/two-sum/description/

// 1. Two Sum
// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = [0,0]
        for index1 in 0..<nums.count-1 {
            for index2 in index1+1..<nums.count {
                if nums[index1]+nums[index2] == target {
                    result[0] = index1
                    result[1] = index2
                    return result
                }
            }
        }
        return result
    }
}