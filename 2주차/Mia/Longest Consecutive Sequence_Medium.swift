class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var mySet = Set(nums)
        var streak = 0
        var largestStreak = 0
        var currentNum:Int? = nil
        mySet.forEach{ num in
            if !mySet.contains(num - 1){
                streak = 1
                currentNum = num
                mySet.remove(num)
                while currentNum != nil {
                    currentNum! += 1
                    if mySet.contains(currentNum!){
                        streak += 1
                        mySet.remove(currentNum!)
                    }else{
                        currentNum = nil
                    }
                }
                largestStreak = max(streak, largestStreak)
            }
        }
        return largestStreak
    }
}