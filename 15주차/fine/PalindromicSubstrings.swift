class Solution {
    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        var count = 0
        
        for i in 0..<chars.count {
            // 홀수 길이 팰린드롬
            count += countPalindromesAroundCenter(chars, left: i, right: i)
            // 짝수 길이 팰린드롬
            count += countPalindromesAroundCenter(chars, left: i, right: i + 1)
        }
        
        return count
    }
    
    private func countPalindromesAroundCenter(_ chars: [Character], left: Int, right: Int) -> Int {
        var L = left, R = right
        var count = 0
        
        while L >= 0 && R < chars.count && chars[L] == chars[R] {
            count += 1
            L -= 1
            R += 1
        }
        
        return count
    }
}