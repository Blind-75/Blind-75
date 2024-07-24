class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let sortedNums = nums.sorted()
        var longestStreak = 1
        var currentStreak = 1
        
        if nums.isEmpty { return 0 }
        for i in 1..<sortedNums.count {
            if sortedNums[i] != sortedNums[i - 1] {
                if sortedNums[i] == sortedNums[i - 1] + 1 {
                    currentStreak += 1
                } else {
                    longestStreak = max(longestStreak, currentStreak)
                    currentStreak = 1
                }
            }
        }
        
        return max(longestStreak, currentStreak)
    }
}