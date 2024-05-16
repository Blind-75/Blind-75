class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charDict = [Character: Int]()  
        var maxLen = 0
        var start = 0

        for (end, char) in s.enumerated() {
            if let prevIndex = charDict[char] {
                start = max(start, prevIndex + 1)
            }
            charDict[char] = end
            maxLen = max(maxLen, end - start + 1)
        }
    return maxLen
    }
}