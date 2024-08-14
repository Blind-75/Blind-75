// DFS 4방탐색 풀이
// visited array로 확인하기

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let m = board.count
        let n = board[0].count
        let wordArray = Array(word)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        // 사방탐색
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        func dfs(_ i: Int, _ j: Int, _ index: Int) -> Bool {
            if index == wordArray.count { 
                return true
            }
            if i < 0 || i >= m || j < 0 || j >= n || visited[i][j] || board[i][j] != wordArray[index] {
                return false
            }

            visited[i][j] = true
            for direction in directions {
                let newRow = i + direction.0
                let newCol = j + direction.1
                if dfs(newRow, newCol, index + 1) {
                    return true
                }
            }
            visited[i][j] = false

            return false
        }
        
        for i in 0..< m {
            for j in 0..< n {
                if dfs(i, j, 0) {
                    return true
                }
            }
        }
        return false
    }
}
