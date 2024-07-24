// https://leetcode.com/problems/valid-anagram/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var charDict : [Character:Int] = [:]
        if (s.count != t.count){
            return false
        }

        for c in s{
            if (!charDict.contains {$0.key == c}) {
                charDict[c] = 1
            }
            else {
                guard let value = charDict[c] else {return false}
                charDict.updateValue(value+1, forKey: c)  
            }
        }
        
        for c in t{
            if(!charDict.contains {$0.key == c}) {
                return false
            }
            guard let value = charDict[c] else {return false}
            charDict.updateValue(value-1, forKey: c)
            if (value-1 < 0){
                return false
            }
        }
    return true
    }
}