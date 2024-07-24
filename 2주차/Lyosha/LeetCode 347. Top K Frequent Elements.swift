// https://leetcode.com/problems/top-k-frequent-elements/description/

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqDist : [Int:Int] = [:]
        for num in nums {
            freqDist[num, default: 0] += 1
        }
     
        let sortedFreq = freqDist.sorted {$0.value > $1.value}
        let sortedKey = sortedFreq.map{ $0.key }
        var ans: [Int] = []
        for i in 0...k-1{
            ans.append(sortedKey[i])
        }
        return ans
    }
}
