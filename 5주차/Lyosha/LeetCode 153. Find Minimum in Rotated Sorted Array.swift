class Solution {
    func isSorted(_ left: Int, _ right: Int, _ nums: [Int]) -> Bool {
        if nums[left] < nums[right]{
            return true
        }
        return false
    }

    func BinarySearch(_ left: Int, _ right: Int, _ nums: [Int]) -> Int {
        let mid: Int = (left + right) / 2
        
        if (right - left <= 2){
            return [nums[left], nums[mid], nums[right]].min()!
        }

        let leftSorted = self.isSorted(left, mid, nums)
        let rightSorted = self.isSorted(mid, right, nums)

        if (leftSorted && rightSorted) {
            return nums[left]
        }
        if (leftSorted && !rightSorted) {
            return self.BinarySearch(mid, right, nums)
        }
        if (!leftSorted && rightSorted){
            return self.BinarySearch(left, mid, nums)
        }
        return -1
    }

    func findMin(_ nums: [Int]) -> Int {
        return self.BinarySearch(0, nums.count-1, nums)
    }
}