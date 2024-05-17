class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }

        var charDict: [Character: Int] = [:]
        var maxLen = 1 
        var left = 0
        var right = 1
        charDict[s[s.startIndex]] = 0

        for (right, char) in s.enumerated() {
            if right < 1 {
                continue
            }
            let c = char
            left = max(left, charDict[c, default: -1]+1)
            charDict[c] = right
            maxLen = max(maxLen, right-left+1)
        }
        return maxLen
    }
}