class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var start = 0
        var maxLength = 0
        
        for i in 0..<chars.count {
            // 홀수 길이 팰린드롬 확인
            let len1 = expandAroundCenter(chars, left: i, right: i)
            // 짝수 길이 팰린드롬 확인
            let len2 = expandAroundCenter(chars, left: i, right: i + 1)
            
            let len = max(len1, len2)
            if len > maxLength {
                start = i - (len - 1) / 2
                maxLength = len
            }
        }
        
        return String(chars[start..<(start + maxLength)])
    }
    
    private func expandAroundCenter(_ chars: [Character], left: Int, right: Int) -> Int {
        var L = left, R = right
        while L >= 0 && R < chars.count && chars[L] == chars[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }
}