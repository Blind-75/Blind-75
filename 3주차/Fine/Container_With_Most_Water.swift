class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0 
        var right = height.count - 1
        var maxArea = 0

        while left < right {

            let currentArea = (right - left) * min(height[left], height[right])
            maxArea = max(maxArea, currentArea)

            if height[left] > height[right]{
                right -= 1
            } else {
                left += 1
            }

        }
        return maxArea
    }
}