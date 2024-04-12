// Contains Duplicates 
// Topics: Array, Hash Table, String

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var myDict = [Int: Int]()
        for i in nums{
            if myDict[i] != nil{
                return true
            }else{
                myDict[i] = 1
            }
        }
        return false
    }
}
// alternative solution - better memory
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var mySet = Set(nums)
        if mySet.count != nums.count{
            return true
        }else{
            return false
        }
    }
}