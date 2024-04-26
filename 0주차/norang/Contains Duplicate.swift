// https://leetcode.com/problems/contains-duplicate/description/
 
// 217. Contains Duplicate
// Given an integer array nums, return true if any value appears at least twice in the array, 
// and return false if every element is distinct.

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        for index1 in 0..<nums.count-1 {
            for index2 in index1+1..<nums.count {
                if index1 != index2 {
                    if nums[index1] == nums[index2] {
                        return true
                    }
                }
            }
        }
        return false
    }
}
