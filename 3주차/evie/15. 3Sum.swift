class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        
        if nums.count < 3 {
            return res
        } else {
            let sortedNums = nums.sorted()
            
            for i in 0..<sortedNums.count {
                if i > 0 && sortedNums[i] == sortedNums[i - 1] {
                    continue
                }
                
                var l = i + 1
                var r = sortedNums.count - 1
                
                while l < r {
                    let threeSum = sortedNums[i] + sortedNums[l] + sortedNums[r]
                    
                    if threeSum > 0 {
                        r -= 1
                    } else if threeSum < 0 {
                        l += 1
                    } else { 
                        res.append([sortedNums[i], sortedNums[l], sortedNums[r]])
                        l += 1
                        while sortedNums[l] == sortedNums[l-1] && l < r {
                            l += 1
                        }
                    }
                }
            }
            return res
        }
    }
}