class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: amount + 1, count: amount + 1)
        
        // 기본 케이스: 0원은 0개의 동전 필요
        dp[0] = 0
        
        // 1원부터 목표 금액까지 반복
        for i in 1...amount {
            // 각 동전에 대해 최소값 계산
            for coin in coins {
                if coin <= i {  // 현재 금액이 동전보다 크거나 같을 때
                    // 현재 값과 (현재 금액 - 동전 가치)의 값 + 1 중 최소값 선택
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        
        // amount+1이면 불가능한 경우이므로 -1 반환
        return dp[amount] == amount + 1 ? -1 : dp[amount]
    }
}