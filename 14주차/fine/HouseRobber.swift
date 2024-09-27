func rob(_ nums: [Int]) -> Int {
    let n = nums.count
    
    if n == 0 {
        return 0
    }

    if n == 1 {
        return nums[0]
    }
    
    var prev2 = nums[0]  // dp[i-2]
    var prev1 = max(nums[0], nums[1])  // dp[i-1]
    
    for i in 2..<n {
        let current = max(prev1, nums[i] + prev2)
        prev2 = prev1  // dp[i-2] 갱신
        prev1 = current  // dp[i-1] 갱신
    }
    
    return prev1  
}
