class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
    // 1. 빈 배열 체크
    if intervals.isEmpty {
        return []
    }
    
    // 2. 시작점 기준으로 정렬
    let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
    
    var result: [[Int]] = []
    var currentInterval = sortedIntervals[0]
    
    // 3. 구간 병합 과정
    for interval in sortedIntervals[1...] {
        // 현재 구간의 끝점이 다음 구간의 시작점보다 크거나 같으면 병합
        if currentInterval[1] >= interval[0] {
            currentInterval[1] = max(currentInterval[1], interval[1])
        } else {
            // 겹치지 않으면 현재 구간을 결과에 추가하고 새로운 구간 시작
            result.append(currentInterval)
            currentInterval = interval
        }
    }
    
    // 4. 마지막 구간 추가
    result.append(currentInterval)
    
    return result
}
}