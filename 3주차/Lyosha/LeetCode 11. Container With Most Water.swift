class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxarea = 0
        var left = 0
        var right = height.count-1
        
        while left < right {
            var width = right-left
            maxarea = max(maxarea, min(height[left], height[right])*width)
            if height[left] <= height[right] {
                left += 1
            }
            else {
                right -= 1
            }
        }
        return maxarea
    }
}
