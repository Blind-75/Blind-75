class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }

        var minCoinsForAmt: Array<Int> = Array(repeating: amount + 1, count: amount + 1)
        minCoinsForAmt[0] = 0 

        for coin in coins{
            guard amount-coin >= 0 else {continue}
            for i in coin...amount{
                minCoinsForAmt[i] = min(minCoinsForAmt[i], minCoinsForAmt[i - coin] + 1)
            }
        }
        return minCoinsForAmt[amount] == amount + 1 ? -1 : minCoinsForAmt[amount]
    }
}m