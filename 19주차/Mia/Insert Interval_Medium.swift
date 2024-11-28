class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var resultArray: [[Int]] = []
        var i = 0 

        while i < intervals.count, intervals[i][1] < newInterval[0] {
            resultArray.append(intervals[i])
            i += 1
        }

        var newInterval = newInterval 

        while i < intervals.count, intervals[i][0] <= newInterval[1] {
            newInterval[0] = Swift.min(newInterval[0], intervals[i][0])
            newInterval[1] = Swift.max(newInterval[1], intervals[i][1])
            i += 1
        }

        resultArray.append(newInterval)

        while i < intervals.count {
            resultArray.append(intervals[i])
            i += 1
        }

        return resultArray
    }
}