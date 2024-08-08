class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count
        let n = board[0].count
        let wordArray = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        
        // 방향 배열 (상, 하, 좌, 우)
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        func dfs(_ i: Int, _ j: Int, _ index: Int) -> Bool {
            // 단어를 모두 찾았을 경우
            if index == wordArray.count {
                return true
            }
            
            // 보드 범위를 벗어나거나, 이미 방문했거나, 현재 문자가 일치하지 않을 경우
            if i < 0 || i >= m || j < 0 || j >= n || visited[i][j] || board[i][j] != wordArray[index] {
                return false
            }
            
            // 현재 셀 방문 처리
            visited[i][j] = true
            
            // 네 방향으로 탐색
            for direction in directions {
                let newI = i + direction.0
                let newJ = j + direction.1
                if dfs(newI, newJ, index + 1) {
                    return true
                }
            }
            
            // 백트래킹: 방문 처리 취소
            visited[i][j] = false
            
            return false
        }
        
        // 보드의 모든 셀에서 시작해보기
        for i in 0..<m {
            for j in 0..<n {
                if dfs(i, j, 0) {
                    return true
                }
            }
        }
        
        return false
    }
}