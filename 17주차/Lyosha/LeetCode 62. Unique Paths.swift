class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        for i in 0..<n { 
            dp[i][0] = 1
        }

        for j in 0..<m {
            dp[0][j] = 1
        }

        for i in 1..<n {
            for j in 1..<m { 
                dp[i][j] = dp[i-1][j]+dp[i][j-1]
            }
        }

        return dp[n-1][m-1]

    }
}