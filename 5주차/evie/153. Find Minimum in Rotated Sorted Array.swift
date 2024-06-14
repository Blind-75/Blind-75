class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start: Int = 0
        var end: Int = nums.count - 1

        while start < end {
            let mid = (start + end) / 2

            if nums[mid] > nums[end] {
                start = mid + 1
            } else {
                end = mid
            }
        }
        return nums[start]
    }
}