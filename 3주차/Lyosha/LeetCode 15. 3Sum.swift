class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        let nums = nums.sorted()
        for i in 0..<nums.count {
            if nums[i] > 0 {
                break
            }
            if i == 0 || nums[i-1] != nums[i] {
                twoSumII(nums, i, &res)
            }
        }
        return res
    }
    
    func twoSumII(_ nums: [Int], _ i: Int, _ res: inout [[Int]]) {
        var lo = i + 1
        var hi = nums.count - 1
        
        while lo < hi {
            let sum = nums[i] + nums[lo] + nums[hi]
            if sum < 0 {
                lo += 1
            } else if sum > 0 {
                hi -= 1
            } else {
                res.append([nums[i], nums[lo], nums[hi]])
                lo += 1
                hi -= 1
                while lo < hi && nums[lo] == nums[lo - 1] {
                    lo += 1
                }
            }
        }
    }
}

