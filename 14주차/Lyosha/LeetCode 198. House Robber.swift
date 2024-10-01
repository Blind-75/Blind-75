class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        var dp: [[Int]] = Array(repeating: Array(repeating: n, count: n), count: 2)

        if n == 1 {
            return nums[0]
        }

        // 0은 그 집을 털지 않았을 때
        // 1은 그 집을 털었을 때

        dp[0][0] = 0
        dp[1][0] = nums[0]

        for i in 1..<n {
            dp[0][i] = max(dp[0][i-1], dp[1][i-1])
            dp[1][i] = dp[0][i-1] + nums[i]
        }

        return max(dp[0][n-1], dp[1][n-1])
    }
}