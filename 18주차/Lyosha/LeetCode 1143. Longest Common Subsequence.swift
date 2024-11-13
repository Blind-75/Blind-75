class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let n = text1.count
        let m = text2.count
        var dp = Array(repeating: Array(repeating: 0, count : m), count : n)
        
        let string1 = Array(text1)
        let string2 = Array(text2)

        if string1[0] == string2[0] {
            dp[0][0] = 1
        } else { 
            dp[0][0] = 0
        }
         
        for i in 1..<n { 
            if string2[0] == string1[i] { 
                  dp[i][0] = 1
            } else {
                dp[i][0] = dp[i-1][0]
            }
        }

        for j in 1..<m { 
            if string2[j] == string1[0] { 
                  dp[0][j] = 1
            } else {
                dp[0][j] = dp[0][j-1]
            }
        }

        for i in 1..<n {
            for j in 1..<m { 
                if string1[i] == string2[j] { 
                    dp[i][j] = 1+max(dp[i-1][j-1], dp[i-1][j-1])
                } else { 
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }

        return dp[n-1][m-1]
    }
}