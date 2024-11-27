class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        if intervals.isEmpty { 
            return true
        }

        let sortedIntervals = intervals.sorted {$0[0] < $1[0]}
        var prev = sortedIntervals[0]

        for curr in sortedIntervals[1..<sortedIntervals.count] { 
            if curr[0] < prev[1] {
                return false
            }
            prev = curr
        }
        return true
    }
}