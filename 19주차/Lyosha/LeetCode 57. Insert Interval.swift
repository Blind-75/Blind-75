//https://leetcode.com/problems/insert-interval/

class Solution {
    func isMergeable(_ interval1: [Int], _ interval2: [Int]) -> Bool {
        if interval1[0] <= interval2[0] {
            if interval2[0] <= interval1[1]  {
                return true
            } else {
                return false
            }
        } else {
            if interval1[0] <= interval2[1] {
                return true
            } else {
                return false
            }
        }
    }

    func mergeInterval(_ interval1: [Int], _ interval2: [Int]) -> [Int] {
        return [min(interval1[0], interval2[0]), max(interval1[1], interval2[1])]
    }

    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        //monotonic stack 유지하기
        //top에 대해서 mergable한지를 check하기
        
        if intervals.count == 0 {
            return [newInterval]
        }
        
        if newInterval[1] < intervals[0][0] {
            return [newInterval] + intervals
        }
        
        if intervals[intervals.count-1][1] < newInterval[0] {
            return intervals + [newInterval]
        }
        
        
        var mystack: [[Int]] = []
        
        var i = 0
        var mergedInterval = newInterval
        
        var isMerged = false
        while i != intervals.count {
            var curr = intervals[i]
            if isMergeable(curr, mergedInterval) {
                while i != intervals.count && isMergeable(intervals[i], mergedInterval) {
                    mergedInterval = mergeInterval(intervals[i], mergedInterval)
                    i += 1
                }
                mystack.append(mergedInterval)
                isMerged = true
                continue
            }
            mystack.append(curr)
            i += 1
        }
        
        if isMerged {
            return mystack
        }
        
        i = 0
        while i != intervals.count {
            if intervals[i][1] < newInterval[0] && newInterval[1] < intervals[i+1][0] {
                return Array(intervals[0...i])+[newInterval]+Array(intervals[i+1..<intervals.count])
            }
            i += 1
        }
        return intervals
    }
}