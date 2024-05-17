class Solution {
func minWindow(_ s: String, _ t: String) -> String {
    let n = s.count, m = t.count
    if n < m { return "" }

    var tCount = [Character: Int]()
    var windowCount = [Character: Int]()
    for char in t {
        tCount[char, default: 0] += 1
    }
    
    let sArray = Array(s)
    var have = 0
    var need = tCount.count
    var result = (-1, Int.max)  
    var left = 0

    for right in 0..<n {
        let char = sArray[right]
        windowCount[char, default: 0] += 1
        
        if let needCount = tCount[char], windowCount[char] == needCount {
            have += 1
        }
        
        while have == need {
            
            if (right - left + 1) < result.1 {
                result = (left, right - left + 1)
            }
            
            windowCount[sArray[left]]! -= 1
            if let needCount = tCount[sArray[left]], windowCount[sArray[left]]! < needCount {
                have -= 1
            }
            left += 1
        }
    }

    return result.1 == Int.max ? "" : String(sArray[result.0..<(result.0 + result.1)])
}

}