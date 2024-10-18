class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var memo = [Int: Int]()

        func dp(_ amount: Int) -> Int { 
            if amount == 0 { 
                return 0
            }

            if amount < 0 { 
                return Int.max
            }

            if let res = memo[amount] { 
                return res
            }

            var minVal = Int.max
            for coin in coins { 
                let res = dp(amount-coin)
                if res != Int.max { 
                    minVal = min(res+1, minVal)
                }
            }

            memo[amount] = minVal
            return minVal
        }

        let result = dp(amount)
        if result == Int.max { 
            return -1
        }
        return result
    }
}