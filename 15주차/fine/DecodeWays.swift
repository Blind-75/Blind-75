class Solution {
    func numDecodings(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        let chars = Array(s)
        guard chars[0] != "0" else { return 0 }
        
        var dp = [Int](repeating: 0, count: s.count + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in 2...s.count {
            // 한 자리 수 확인
            if chars[i-1] != "0" {
                dp[i] += dp[i-1]
            }
            
            // 두 자리 수 확인
            let twoDigit = Int(String(chars[i-2...i-1]))!
            if twoDigit >= 10 && twoDigit <= 26 {
                dp[i] += dp[i-2]
            }
        }
        
        return dp[s.count]
    }
}