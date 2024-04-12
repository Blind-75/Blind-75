// https://leetcode.com/problems/contains-duplicate/description/
 
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numSet = Set<Int>()
        for num in nums {
            if numSet.contains(num) {
                return true
            }
            numSet.insert(num)
        }
        return false
    }
}
