//https://leetcode.com/problems/non-overlapping-intervals/description/

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var sortedIntervals: [[Int]] = intervals.sorted {$0[1] < $1[1]}
        var mystack: [[Int]] = []
        
        for interval in sortedIntervals { 
            if mystack.isEmpty || mystack[mystack.count-1][1] <= interval[0] { 
                mystack.append(interval)
            }
        }

        return sortedIntervals.count - mystack.count
    }
}