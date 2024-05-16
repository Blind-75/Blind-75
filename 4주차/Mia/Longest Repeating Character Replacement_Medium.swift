// 파인 감사해요....
class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var maxCount = 0 
        var maxLength = 0
        var freqMap = [Character: Int]()
        var char = Array(s)
        var p1 = 0

        for (p2, end) in char.enumerated(){
            freqMap[end, default: 0] += 1
            maxCount = Swift.max(maxCount, freqMap[end]!)
            while (p2 - p1 + 1) - maxCount > k{
                freqMap[char[p1]]! -= 1
                p1 += 1
                maxCount = freqMap.values.max()!
            }
            var length = p2 - p1 + 1
            maxLength = Swift.max(maxLength, length)
        }
        return maxLength
    }
}