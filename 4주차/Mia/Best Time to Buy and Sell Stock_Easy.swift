class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var p1 = 0 
        var p2 = 1
        var max = 0

        while p1 < prices.count && p2 < prices.count{
            if prices[p2] < prices[p1]{
                p1 = p2
            }else if prices[p2] >= prices[p1]{
                var diff = prices[p2] - prices[p1]
                max = Swift.max(max, diff)
            }
            p2 += 1
        }
        return max
    }
}