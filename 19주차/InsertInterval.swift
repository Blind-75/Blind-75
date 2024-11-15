class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    // 1. intervals가 비어있는 경우
    if intervals.isEmpty {
        return [newInterval]
    }
    
    var result: [[Int]] = []
    var newInt = newInterval
    var i = 0
    
    // 2. newInterval 이전의 구간들 추가
    while i < intervals.count && intervals[i][1] < newInt[0] {
        result.append(intervals[i])
        i += 1
    }
    
    // 3. 겹치는 구간들 병합
    while i < intervals.count && intervals[i][0] <= newInt[1] {
        newInt[0] = min(newInt[0], intervals[i][0])
        newInt[1] = max(newInt[1], intervals[i][1])
        i += 1
    }
    result.append(newInt)
    
    // 4. newInterval 이후의 구간들 추가
    while i < intervals.count {
        result.append(intervals[i])
        i += 1
    }
    
    return result
    }
}