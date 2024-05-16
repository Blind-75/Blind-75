class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var minPrice = prices[0]
        var maxProfit = 0
        
        for i in 1..<prices.count {
            let currentPrice = prices[i]
            let potentialProfit = currentPrice - minPrice
            maxProfit = max(maxProfit, potentialProfit)
            minPrice = min(minPrice, currentPrice)
        }
        return maxProfit
    }
}