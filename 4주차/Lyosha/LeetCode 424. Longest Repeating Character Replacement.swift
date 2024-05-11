class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        if s.count == 1 { 
            return 1
        }
        var answer = 0
        var freqDist: [Character: Int] = [:]
        var left = 0
        var maxLen = 0
        var count = 0
        var arrS = Array(s)
        for (right, c) in s.enumerated(){
           freqDist[c, default: 0] += 1
           count += 1
           var maxFreq = freqDist.max{$0.value < $1.value}
           while count-maxFreq!.value > k { 
                freqDist[arrS[left], default: 0] -= 1
                count -= 1
                left += 1
                maxFreq = freqDist.max{$0.value < $1.value}
            }
            maxLen = max(maxLen, right - left + 1)
        }
        return maxLen
        }    
    }