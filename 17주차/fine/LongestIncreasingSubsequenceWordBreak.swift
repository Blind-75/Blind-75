class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        // dp[i]는 i번째 인덱스에서 끝나는 가장 긴 증가 부분 수열의 길이
        var dp = Array(repeating: 1, count: n)
        var maxLength = 1
        
        // 각 위치에서 가능한 가장 긴 증가 부분 수열 찾기
        for i in 1..<n {
            // i 이전의 모든 원소들 확인
            for j in 0..<i {
                // 현재 수가 이전 수보다 크면 증가 수열 가능
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
            maxLength = max(maxLength, dp[i])
        }
        
        return maxLength
    }
}