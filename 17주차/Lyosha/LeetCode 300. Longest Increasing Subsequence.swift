class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var memo: [Int: Int] = [:]
        func dp(_ i: Int) -> Int { 
            if i  == nums.count { 
                return 1
            }

            if memo[i] != nil { 
                return memo[i]!
            }

            var maxVal = 1
            for j in i..<nums.count {
                if nums[i] < nums[j]{ 
                    maxVal = max(maxVal, 1+dp(j))
                }
            }
            memo[i] = maxVal
            return maxVal
        }

        var maxVal = 1 
        for i in 0..<nums.count {
            maxVal = max(maxVal, dp(i))
        }
        return maxVal

    }
}