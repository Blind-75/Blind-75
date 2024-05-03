class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // sort the array? 
        var p1 = 0 
        var p2 = 1
        var p3 = nums.count - 1
        var nums = nums.sorted()
        var result = [[Int]]()
        while p1 < nums.count && p2 < nums.count{
            let target = 0 - nums[p1]
            while p2 < p3{
                if (nums[p2] + nums[p3]) < target{
                    p2 += 1
                }else if (nums[p2] + nums[p3]) > target{
                    p3 -= 1
                }else if (nums[p2] + nums[p3]) == target{
                    let array = [nums[p2], nums[p3], nums[p1]].sorted()
                    if !result.contains(array){
                        result.append(array)
                    }
                    p2 += 1
                    p3 -= 1
                }
            }
            p1 += 1
            p2 = p1 + 1
            p3 = nums.count - 1
        }
        return result
    }
}

// consider the fact that since the array is already sorted, we can use the sum to determine with pointer to move 
// remember that when using pointers use p2 < p3 not vice versa