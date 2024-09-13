```swift
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid // 변경 가능한 grid 복사본 생성
        var islandCount = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    dfs(&grid, i, j)
                    islandCount += 1
                }
            }
        }
        
        return islandCount
    }
    
    func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        // 경계 체크 및 물("0") 체크
        if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count || grid[i][j] == "0" {
            return
        }
        
        // 현재 위치를 방문했다고 표시 (물로 변경)
        grid[i][j] = "0"
        
        // 상하좌우 재귀적으로 탐색
        dfs(&grid, i-1, j) // 위
        dfs(&grid, i+1, j) // 아래
        dfs(&grid, i, j-1) // 왼쪽
        dfs(&grid, i, j+1) // 오른쪽
    }
}
