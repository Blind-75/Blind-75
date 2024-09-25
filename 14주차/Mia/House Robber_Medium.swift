class Solution {
    func rob(_ nums: [Int]) -> Int {
        var array = nums 
        var count = array.count
        if count == 1 {
            return array[0]
        }
        array[1] = max(array[0], array[1])
        for i in 2..<count {
            array[i] = max(array[i-2] + array[i], array[i-1])
        }
        return array[count-1]
    }
}