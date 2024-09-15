class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var visited: Set<Location> = []
        var adjacent = [(1,0), (0,1), (-1, 0), (0,-1)]
        var count = 0

        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" && !visited.contains(Location(i: i, j: j)) {
                    dfs(index: (i,j))
                    count += 1
                }
            }
        }

        return count

        
        func dfs(index: (Int, Int)) {
            if visited.contains(Location(i: index.0, j: index.1)) { return }
            if grid[index.0][index.1] == "0" { return }
            visited.insert(Location(i: index.0, j: index.1))

            for offset in adjacent {
                var r = index.0 + offset.0
                var c = index.1 + offset.1

                if r >= 0 && r < grid.count && c >= 0 && c < grid[0].count {
                    dfs(index: (r, c))
                }
            }
        }

        struct Location: Hashable {
            var i: Int
            var j: Int

            init(i: Int, j: Int) {
                self.i = i
                self.j = j
            }

            func hash(into hasher: inout Hasher) {
                hasher.combine(i)
                hasher.combine(j)
            }

            static func == (lhs: Location, rhs: Location) -> Bool {
                return lhs.i == rhs.i && lhs.j == rhs.j
            }
        }
    }
}