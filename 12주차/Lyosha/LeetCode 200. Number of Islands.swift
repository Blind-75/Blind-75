//https://leetcode.com/problems/number-of-islands/

class Solution {
    var myqueue : [[Int]]
    init(){
        myqueue = []
    }

    func isValid(_ i: Int,_ j: Int,_ m: Int,_ n: Int) -> Bool {
        if 0 <= i && i <= m-1 && 0 <= j && j <= n-1 {
            return true
        }
        return false
    }

    func bfs(_ grid: [[Character]], _ visited: inout [[Bool]]) -> Void {
        let m = grid.count
        let n = grid[0].count
        
        let d_rows = [0, 1, 0, -1]
        let d_cols = [1, 0, -1, 0]
        
        while !self.myqueue.isEmpty {
            let curr = self.myqueue.removeFirst()
            let curr_row = curr[0]
            let curr_col = curr[1]
            for (d_row, d_col) in zip(d_rows, d_cols) {
                let next_row = curr_row+d_row
                let next_col = curr_col+d_col
                if self.isValid(next_row, next_col, m, n) && !visited[next_row][next_col] && grid[next_row][next_col] == "1"{
                    self.myqueue.append([next_row, next_col])
                    visited[next_row][next_col] = true
                }
            }
        }
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count

        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var num = 0

        for (i, row) in grid.enumerated() {
            for (j, item) in row.enumerated() {
                if item == "1" && !visited[i][j]{
                    visited[i][j] = true
                    self.myqueue.append([i, j])
                    self.bfs(grid, &visited)
                    num += 1
                }
            }
        }

        return num
    }
}
