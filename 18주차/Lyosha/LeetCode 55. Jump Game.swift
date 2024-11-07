class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        //0에 걸리면 못간다 ...
        if nums.count == 1 {
            return true
        }
        
        if nums[0] == 0 {
            return false
        }
        
        let n = nums.count
        var memo: [Int] = Array(repeating: Int.min, count: nums.count)
        memo[nums.count-1] = 1
        
        func dp(_ i: Int) -> Int {
            if memo[i] != Int.min {
                return memo[i]
            }
            

            let nextIndexBound = nums[i]+i
            
            if nums[i] == 0 {
                memo[i] = 0
                return memo[i]
            }
            
            if n-1 <= nextIndexBound {
                memo[i] = 1
                return memo[i]
            }
            
            for j in i+1...nextIndexBound {
                if dp(j) == 1 {
                    memo[i] = 1
                    return memo[i]
                }
            }
            
            memo[i] = 0
            return memo[i]
        }
        
        
        for i in 0..<min(n-1, nums[0]) {
            dp(i)
        }
        
        for i in 0..<min(n-1, nums[0]) {
            if memo[0] == 1 {
                return true
            }
        }
        return false
    }
}