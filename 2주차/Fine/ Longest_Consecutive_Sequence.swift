class Solution{

    // Time limit
    func longestConsecutive(_ nums: [Int]) -> Int {

        guard !nums.isEmpty else {
            return 0
        }

        let numSet: Set<Int> = Set(nums)
        var longestStreak = 0

        for num in numSet {
            // 주어진 수의 이전수가 존재하는지 확인 
            // 존재하지 않는 경우 해당수가 출발 수 
            if !numSet.contains(num - 1){

                var currentNum = num 
                var currentStreak = 1

                while numSet.contains(currentNum + 1){
                    currentNum += 1
                    currentStreak += 1
                }

                 longestStreak = max(longestStreak, currentStreak)
            }

           

        }

        return longestStreak 
    }

    func longestConsecutiveG(_ nums: [Int]) -> Int {
      if nums.isEmpty {return 0}

      let sortedNums = nums.sorted()
      var longestStreak = 1
      var currentStreak = 1

      for i in 1..<sortedNums.count {
        if sortedNums[i] != sortedNums[i-1]{
            if sortedNums[i] == sortedNums[i-1] + 1 {
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