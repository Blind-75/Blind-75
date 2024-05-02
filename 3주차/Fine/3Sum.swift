class Solution{
    func threeSum(_ nums: [Int]) -> [Int]{
        guard nums.count >= 3 else {
            return []
        }

        var result = [[Int]]()
        let nums = nums.sorted()
        let len = nums.count 

        for i in 0 ..< len - 2 {

            if i > 0 && num[i] == num[i-1]{
                continue
            }

            var left = i + 1
            var right = len - 1 

            while left < right {
                
                let sum = nums[i] + nums[left] + nums[right]

                if sum == 0 {
                    result.append([num[i], num[left], num[right]])

                    while left < right && nums[left] == nums[left + 1] {
                        left += 1
                    }

                    while left < right && nums[right] == nums[right - 1]   {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sum < 0{
                    left += 1
                } else {
                    right -= 1
                }


            }

        }
        return result

    }
}