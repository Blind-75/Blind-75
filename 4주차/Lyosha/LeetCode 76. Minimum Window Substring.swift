//https://leetcode.com/problems/minimum-window-substring/description/

//my code -> time limit exceed
class Solution {
    func isValid(_ targetDict: [Character: Int], _ windowDict: [Character: Int]) -> Bool{
        guard targetDict.count == windowDict.count else {
            return false
        }
        
        let sortedTargetDict = targetDict.sorted { $0.key < $1.key }
        let sortedWindowDict = windowDict.sorted { $0.key < $1.key }
        
        for (item1, item2) in zip(sortedTargetDict, sortedWindowDict) {
            if (item1.key != item2.key || item2.value < item1.value) {
                return false
            }
        }
        return true
    }
    
    func minWindow(_ s: String, _ t: String) -> String {
        let n = s.count
        let m = t.count
        
        if n < m {
            return ""
        }
        
        var targetDict: [Character: Int] = [:]
        var windowDict: [Character: Int] = [:]
        
        for (i, c) in t.enumerated(){
            targetDict[c, default: 0] += 1
        }
        
        var left = 0
        while left < n && !targetDict.contains(where: {$0.key == s[s.index(s.startIndex, offsetBy: left)]}) {
            left += 1
        }
        
        if left == n {
            return ""
        }
        
        var right = left
        var answer = s+"123"
        
        while right < n {
            let c = s[s.index(s.startIndex, offsetBy: right)]
            if !(targetDict.contains{$0.key == c}){
                right += 1
                continue
            }
            windowDict[c, default: 0] += 1
            
            if !self.isValid(targetDict, windowDict){
                right += 1
                continue
            }
            
            let substring = String(s[s.index(s.startIndex, offsetBy: left)...s.index(s.startIndex, offsetBy: right)])
            answer = answer.count <= substring.count ? answer : substring
            
            while (left < n) && (left != right) {
                if !(targetDict.contains{$0.key == s[s.index(s.startIndex, offsetBy: left)]}){
                    left += 1
                    continue
                }
                
                let substring = String(s[s.index(s.startIndex, offsetBy: left)...s.index(s.startIndex, offsetBy: right)])
                answer = answer.count <= substring.count ? answer : substring
                windowDict[s[s.index(s.startIndex, offsetBy: left)], default: 0] -= 1
                if self.isValid(targetDict, windowDict){
                    left += 1
                    continue
                }
                windowDict[s[s.index(s.startIndex, offsetBy: left)], default: 0] += 1
                break
            }
            right += right < n ? 1 : 0
        }
        if self.isValid(targetDict, windowDict){
            let substring = String(s[s.index(s.startIndex, offsetBy: left)..<s.index(s.startIndex, offsetBy: right)])
            answer = answer.count <= substring.count ? answer : substring
        }
        if answer == s+"123"{
            return ""
        }
        return answer
    }


    //GPT-generated code
    func minWindow(_ s: String, _ t: String) -> String {
        let sChars = Array(s)
        let tChars = Array(t)
        
        var targetCount = [Character: Int]()
        for char in tChars {
            targetCount[char, default: 0] += 1
        }
        
        var minWindowSize = Int.max
        var minWindowStart = 0
        var windowStart = 0
        var matchedCount = 0
        var windowCount = [Character: Int]()
        
        for windowEnd in 0..<sChars.count {
            let char = sChars[windowEnd]
            windowCount[char, default: 0] += 1
            
            if let targetCharCount = targetCount[char], windowCount[char] == targetCharCount {
                matchedCount += 1
            }
            
            // Try to minimize the window size by shrinking from the start
            while matchedCount == targetCount.count {
                if windowEnd - windowStart + 1 < minWindowSize {
                    minWindowSize = windowEnd - windowStart + 1
                    minWindowStart = windowStart
                }
                
                let startChar = sChars[windowStart]
                if let targetCharCount = targetCount[startChar], let windowCharCount = windowCount[startChar] {
                    if windowCharCount == targetCharCount {
                        matchedCount -= 1
                    }
                }
                windowCount[startChar]! -= 1
                windowStart += 1
            }
        }
        
        if minWindowSize == Int.max {
            return ""
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: minWindowStart)
        let endIndex = s.index(startIndex, offsetBy: minWindowSize)
        return String(s[startIndex..<endIndex])
    }
}