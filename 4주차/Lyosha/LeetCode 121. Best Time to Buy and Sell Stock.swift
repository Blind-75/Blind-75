//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }

        var left = 0
        var right = 1
        var maxProfit = 0

        while right < prices.count {
            if prices[left] <= prices[right]{
                maxProfit = max(maxProfit, prices[right]-prices[left])
                right += 1
            }
            else {
                left = right
                right = left+1
            }
        }
        return maxProfit
    }
}