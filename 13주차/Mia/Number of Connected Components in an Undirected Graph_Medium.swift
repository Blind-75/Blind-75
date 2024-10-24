class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var visited = Set<Int>()
        var dictionary = [Int: [Int]]()
        var count = 0

        for edge in edges {
            var node = edge[0]
            var nextNode = edge[1]
            if var existing = dictionary[node] {
                existing.append(nextNode)
                dictionary[node] = existing
            } else {
                dictionary[node] = [nextNode]
            }

            if var existing = dictionary[nextNode] {
                existing.append(node)
                dictionary[nextNode] = existing
            } else {
                dictionary[nextNode] = [node]
            }
        }

        func dfs(node: Int) {
            visited.insert(node)
            if let neighbours = dictionary[node] {
                for neighbour in neighbours {
                    if !visited.contains(neighbour) {
                        dfs(node: neighbour)
                    }
                }
            }
            
        }

        for i in 0..<n {
            if !visited.contains(i) {
                count += 1 
                dfs(node: i)
            }
        }

        return count
    }
}