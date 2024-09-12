class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        guard !heights.isEmpty && !heights[0].isEmpty else { return [] }
        let m = heights.count
        let n = heights[0].count
        var pacificReachable = Array(repeating: Array(repeating: false, count: n), count: m)
        var atlanticReachable = Array(repeating: Array(repeating: false, count: n), count: m)
        
        // DFS from Pacific edges
        for i in 0..<m {
            dfs(heights, &pacificReachable, i, 0, m, n)
        }
        for j in 0..<n {
            dfs(heights, &pacificReachable, 0, j, m, n)
        }
        
        // DFS from Atlantic edges
        for i in 0..<m {
            dfs(heights, &atlanticReachable, i, n-1, m, n)
        }
        for j in 0..<n {
            dfs(heights, &atlanticReachable, m-1, j, m, n)
        }
        
        // Find cells reachable from both oceans
        var result: [[Int]] = []
        for i in 0..<m {
            for j in 0..<n {
                if pacificReachable[i][j] && atlanticReachable[i][j] {
                    result.append([i, j])
                }
            }
        }
        
        return result
    }
    
    func dfs(_ heights: [[Int]], _ reachable: inout [[Bool]], _ i: Int, _ j: Int, _ m: Int, _ n: Int) {
        reachable[i][j] = true
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        for (di, dj) in directions {
            let newI = i + di
            let newJ = j + dj
            
            if newI >= 0 && newI < m && newJ >= 0 && newJ < n && 
               !reachable[newI][newJ] && heights[newI][newJ] >= heights[i][j] {
                dfs(heights, &reachable, newI, newJ, m, n)
            }
        }
    }
}