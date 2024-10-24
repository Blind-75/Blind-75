class Solution {
    func numDecodings(_ s: String) -> Int {
        let n = s.count
        let S = Array(s)

        //edge case
        if S[0] == "0" {
            return 0
        }

        var dict: [String: Character] = [:]
        for (num, char) in zip(Array(1...26), Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")){
            dict[String(num)] = char
        }

        //base case
        var dp = Array(repeating: 0, count: n+1)
        if S[n-1] == "0" {
            dp[n-1] = 0
            dp[n] = 1
        } else {
            dp[n-1] = 1
            dp[n] = 1
        }

        if n == 1 {
            return dp[n-1]
        }

        // fill in dp table from the tails
        for i in Array(0..<n-1).reversed() {
            //normal situation
            if S[i] == "1" {
                if S[i+1] != "0" {
                    if i != n-1 {
                        dp[i] = dp[i+1]+dp[i+2] // 두가지 방식의 디코딩이 가능함
                    } else {
                        dp[i] = dp[i+1] // 한가지 방식의 디코딩만 가능함
                    }
                } else {
                    dp[i] = dp[i+2]
                }
            } else if S[i] == "2" {
                if Array("123456").contains(S[i+1]) {
                    if i != n-1 {
                        dp[i] = dp[i+1] + dp[i+2]
                    } else {
                        dp[i] = dp[i+1]
                    }
                } else {
                    dp[i] = dp[i+2]
                }
            } else if S[i] == "0" {
                dp[i] = 0
            } else {
                dp[i] = dp[i+1]
            }
        }
        
        return dp[0]
    }
}
