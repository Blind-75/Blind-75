class Solution {
    var memo: [String: Bool] = [:]
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if let checkedResult = memo[s] {
            return checkedResult
        } 
        let wordCount = wordDict.count 

        if s.count == 0 {
            return true
        }

        for i in 0..<wordCount {
            let word = wordDict[i]
            if s.hasPrefix(word) {
                let next = String(s.dropFirst(word.count))
                if wordBreak(next, wordDict) {
                    memo[next] = true
                    return true
                }
            }
        }

        memo[s] = false
        return false
    }
}