class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var n = nums.count
        var maxArray = Array(repeating: -11, count: n)
        var minArray = Array(repeating: 11, count: n)
        var maxNumber = nums[0]
        maxArray[0] = nums[0]
        minArray[0] = nums[0]

        for i in 1..<n {
            var curr = nums[i]
            maxArray[i] = max(curr, maxArray[i-1] * curr, minArray[i-1] * curr)
            minArray[i] = min(curr, maxArray[i-1] * curr, minArray[i-1] * curr)
            maxNumber = max(maxNumber, maxArray[i])
        }
        return maxNumber
    }   
}