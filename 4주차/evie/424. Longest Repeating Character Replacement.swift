// 시간초과

class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var left = 0 
        var maxLen = 0 
        var count = [Character: Int]()
        
        for right in 1...s.count {
            let index = s.index(s.startIndex, offsetBy: right - 1) 
            let char = s[index] 
            count[char, default: 0] += 1
            
            guard let most = count.values.max() else { return 0 }
            
            let remain = right - left - most
            
            if remain > k {
                let leftChar = s[s.index(s.startIndex, offsetBy: left)]
                count[leftChar]! -= 1
                left += 1
            }
            
            maxLen = max(maxLen, right - left)
        }
        
        return maxLen
    }
}
