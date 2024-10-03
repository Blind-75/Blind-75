class Solution {
    func rob2(_ nums: [Int])-> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }

        var dp = Array(repeating: Array(repeating: 0, count: nums.count), count: 2)
        
        dp[0][0] = 0
        dp[1][0] = nums[0]
        dp[0][1] = dp[1][0] //nums[0]
        dp[1][1] = nums[1]
        

        for i in Array(2..<nums.count) {
            dp[0][i] = max(dp[0][i-1], dp[1][i-1]) 
            dp[1][i] = dp[0][i-1]+nums[i]
        }

        return max(dp[0][nums.count-1], dp[1][nums.count-1])
    }

    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }

        let nums1 = Array(nums[1...(nums.count-1)])  // Slice from the second element to the end
        let nums2 = Array(nums[..<(nums.count-1)])  // Slice from the beginning to the second-to-last ele
        return max(rob2(nums1), rob2(nums2))
    }
}
