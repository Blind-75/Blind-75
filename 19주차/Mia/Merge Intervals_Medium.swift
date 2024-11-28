class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
    var intervals = intervals.sorted { $0[0] < $1[0] }
    var resultArray: [[Int]] = [intervals[0]]
        
        for i in 1..<intervals.count {
            var lastInterval = resultArray.last!
            
            if lastInterval[1] >= intervals[i][0] {
                lastInterval[1] = max(lastInterval[1], intervals[i][1])
                resultArray[resultArray.count - 1] = lastInterval
            } else {
                resultArray.append(intervals[i])
            }
        }
        
        return resultArray
    }
}