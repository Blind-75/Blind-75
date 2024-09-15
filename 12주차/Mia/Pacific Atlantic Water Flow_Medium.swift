class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var rows = heights.count
        var cols = heights[0].count 

        var pacific = Array(repeating: Array(repeating: false, count: cols), count: rows)
        var atlantic = pacific

        var result: [[Int]] = []

        var directions = [(0, 1), (1, 0), (-1, 0), (0, -1)]

        func dfs(i: Int, j: Int, visited: inout [[Bool]]) {
            guard visited[i][j] == false else {return}
            visited[i][j] = true 
            for d in directions {
                var r = i + d.0
                var c = j + d.1
                guard r >= 0 && r < heights.count && c >= 0 && c < heights[0].count else { continue }
                guard heights[r][c] >= heights[i][j] else { continue }
                dfs(i: r, j: c, visited: &visited)
            }
        }

        for i in 0..<rows {
            dfs(i: i, j: 0, visited: &pacific)
            dfs(i: i, j: cols-1, visited: &atlantic)
        }

        for j in 0..<cols {
            dfs(i: 0, j: j, visited: &pacific)
            dfs(i: rows-1, j: j, visited: &atlantic)
        }

        for i in 0..<rows {
            for j in 0..<cols {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i,j])
                }
            }
        }

        return result
    }
}