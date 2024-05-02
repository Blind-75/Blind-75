class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var max = 0 
        var p1 = 0
        var p2 = height.count - 1 

        while p1 < p2 {
            var y = p2 - p1 
            var x = min(height[p1], height[p2])
            var area = y*x
            max = Swift.max(max, area)
            if height[p1] < height[p2]{
                p1 += 1
            }else{
                p2 -= 1
            }
        }
        return max
    }
}