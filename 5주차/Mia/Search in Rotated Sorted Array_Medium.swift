class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0 
        var right = nums.count - 1 

        while left <= right{
            let mid = left + (right - left) / 2
            guard nums[mid] != target else {return mid} 

            if nums[left] < nums[mid]{
                if nums[left] <= target, target < nums[mid]{
                    right = mid - 1 
                }else{
                    left = mid + 1
                }
            }else if nums[left] > nums[mid]{
                if nums[mid] < target, target <= nums[right]{
                    left = mid + 1 
                }else{
                    right = mid - 1
                }
            }else{
                left = mid + 1
            }
        }
        return -1
    }
}