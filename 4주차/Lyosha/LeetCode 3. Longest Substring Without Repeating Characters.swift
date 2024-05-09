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

        while right < s.count{
            // var c = arrS[right]
            // var c = s[right]
            var c = s[s.index(s.startIndex, offsetBy: right)]
            left = max(left, charDict[c, default: -1]+1)
            charDict[c] = right
            maxLen = max(maxLen, right-left+1)
            right += 1
        }
        return maxLen
    }
}