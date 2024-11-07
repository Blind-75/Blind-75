class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var acc = 0
        var arr: [Int] = []
        for num in nums {
            acc += num
            arr.append(acc)
        }
        
        var val = 100001
        var minVal: [Int] = []
        minVal.append(val)
        for num in arr {
            val = min(num, val)
            minVal.append(val)
        }

        var maxVal = Int.min
        for (num, val) in zip(arr, minVal) {
            maxVal = max(maxVal, num-val, num)
        }

        return maxVal
    }
}