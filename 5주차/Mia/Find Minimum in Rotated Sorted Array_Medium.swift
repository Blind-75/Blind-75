class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0 
        var right = nums.count - 1 

        while left < right{
            var mid = (left + right) / 2
            if nums[mid] > nums[right]{
                left = mid + 1
            }else{
                right = mid
            }
        }

        return nums[left]
    }
}