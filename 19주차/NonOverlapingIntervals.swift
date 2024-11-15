class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    // 1. 빈 배열이나 하나의 구간만 있는 경우
    if intervals.count <= 1 {
        return 0
    }
    
    // 2. 끝점 기준으로 정렬
    let sorted = intervals.sorted { $0[1] < $1[1] }
    var count = 0
    var prevEnd = sorted[0][1]
    
    // 3. 겹치는 구간 확인
    for i in 1..<sorted.count {
        if sorted[i][0] < prevEnd {
            // 겹치는 경우 제거
            count += 1
        } else {
            // 겹치지 않는 경우 끝점 업데이트
            prevEnd = sorted[i][1]
        }
    }
    
    return count
    }
}