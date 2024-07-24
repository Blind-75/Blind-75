class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start: Int = 0
        var end: Int = nums.count - 1

        while start <= end {
            let mid: Int = (start + end) / 2
            
            if nums[mid] == target {
                return mid
            } else if nums[start] <= nums[mid] {
                if nums[start] <= target && nums[mid] > target {
                    end = mid - 1
                } else {
                    start = mid + 1
                } 
            } else {
                if nums[mid] < target && target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }
        return -1
    }
}

// 이진 탐색
// OlogN 시간복잡도
// 오름차순으로 정렬된 배열에서만 사용 가능