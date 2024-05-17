class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var maxArea = 0
        
        while right - left > 0 {
            maxArea = max(maxArea, (right - left) * min(height[left], height[right]))
            
            if height[left] >= height[right] {
                right -= 1
            } else {
                left += 1
            }
        }
        return maxArea
    }
}