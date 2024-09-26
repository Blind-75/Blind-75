class Solution {
    func rob(_ nums: [Int]) -> Int {
        // 집이 하나일 경우
        if nums.count == 1 {
            return nums[0]
        }
    
        // Helper function: 일렬로 배치된 집을 털 때의 최대 금액 계산
        func robLine(_ houses: [Int]) -> Int {
            var prev2 = 0  // dp[i-2]
            var prev1 = 0  // dp[i-1]
        
            for money in houses {
                let current = max(prev1, money + prev2)
                prev2 = prev1
                prev1 = current
            }
        
            return prev1
        }
    
        // 첫 번째 집을 포함하고 마지막 집을 포함하지 않는 경우
        let option1 = robLine(Array(nums[0..<nums.count - 1]))
    
        // 첫 번째 집을 포함하지 않고 마지막 집을 포함하는 경우
        let option2 = robLine(Array(nums[1..<nums.count]))
    
        // 두 경우 중 더 큰 값을 반환
        return max(option1, option2)
    }

}