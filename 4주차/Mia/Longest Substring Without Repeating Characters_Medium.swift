class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var char = [Character: Int]()
        var myString = Array(s)
        var count = myString.count
        var max = 0 
        var p1 = 0 
        var p2 = 1
        if count == 1{
            return 1
        }
        while p1 < count && p2 < count{
            if char.isEmpty{
                char[myString[p1]] = p1
                max = Swift.max(max, 1)
            }
            if let index = char[myString[p2]]{
                if index >= p1{
                    p1 = index + 1
                    char[myString[p2]] = p2
                    p2 += 1
                    continue
                }
            }
                char[myString[p2]] = p2
                var diff = p2 - p1 + 1
                max = Swift.max(max, diff)
                p2 += 1
        }
        return max
    }
}