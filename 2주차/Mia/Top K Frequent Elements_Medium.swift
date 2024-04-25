class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        var result = [Int]()
        for i in nums{
            if let value = dict[i]{
                dict[i]! += 1
            }else{
                dict[i] = 1
            }
        }

        for j in 0..<k{
            var tuple = dict.max{a, b in a.value < b.value }
            if let key = tuple?.key{
                result.append(key)
                dict.removeValue(forKey: key)
            }
        }
        return result
    }
}