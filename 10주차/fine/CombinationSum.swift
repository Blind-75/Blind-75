class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = []
        var current: [Int] = []
        
        // 백트래킹 함수
        func backtrack(_ remain: Int, _ start: Int) {
            if remain == 0 {
                // 목표 합에 도달했을 때 현재 조합을 결과에 추가
                result.append(current)
                return
            }
            if remain < 0 {
                // 목표 합을 초과했을 때 중단
                return
            }
            
            // 가능한 모든 후보에 대해 시도
            for i in start..<candidates.count {
                current.append(candidates[i])
                // 재귀적으로 다음 단계 탐색
                backtrack(remain - candidates[i], i)
                current.removeLast()
            }
        }
        
        backtrack(target, 0)
        return result
    }
}