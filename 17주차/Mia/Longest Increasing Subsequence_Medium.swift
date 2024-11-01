class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = [Int](repeating: 1, count: nums.count)

        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[j] < nums[i] {
                    var subLength = dp[j] + 1 
                    dp[i] = Swift.max(dp[i], subLength)
                }
            }
        }
        var result = 0
        for max in dp {
            result = Swift.max(max, result)
        }
        return result
    }
}