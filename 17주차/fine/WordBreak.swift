class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        
        let chars = Array(s)
        
        // 각 위치별로 확인
        for i in 1...s.count {
            // j는 이전 위치들을 나타냄
            for j in 0..<i {
                // 이전 위치까지 가능하고
                if dp[j] {
                    // j부터 i까지의 부분 문자열이 사전에 있는지 확인
                    let word = String(chars[j..<i])
                    if wordDict.contains(word) {
                        dp[i] = true
                        break
                    }
                }
            }
        }
        
        return dp[s.count]
    }
}