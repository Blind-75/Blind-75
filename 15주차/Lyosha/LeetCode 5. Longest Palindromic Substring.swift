class Solution {
    func longestPalindrome(_ s: String) -> String {
        let arrS = Array(s)
        let n = s.count
        if n == 1 {
            return s
        }
        var dp = Array(repeating: Array(repeating: false, count: n), count: n)
        var ans = [0, 0]
        
        for i in 0..<n {
            dp[i][i] = true
        }
        
        for i in 0..<n-1 {
            if arrS[i] == arrS[i+1] {
                dp[i][i+1] = true
                ans = [i, i+1]
            }
        }
        
        for diff in 2..<n {
            for i in 0..<n-diff {
                var j = i + diff
                if arrS[i] == arrS[j] && dp[i+1][j-1] {
                    dp[i][j] = true
                    ans = [i, j]
                }
            }
        }
        
        let i = ans[0]
        let j = ans[1]
        return String(arrS[i...j])
        
    }
}