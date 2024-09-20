class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n - 1 {
            return false
        }

        var visited = Set<Int>()

        var childrenList = [Int: [Int]]()

        for i in edges {
            if var children = childrenList[i[0]] {
                children.append(i[1])
                childrenList[i[0]] = children
            } else {
                childrenList[i[0]] = [i[1]]
            }

            if var children = childrenList[edge[1]] {
                children.append(edge[0])
                childrenList[edge[1]] = children
            } else {
                childrenList[edge[1]] = [edge[0]]
            }
        }

        func dfs(value: Int, parent: Int) -> Bool {
            visited.insert(value)
            if let neighbors = childrenList[node] {
                for neighbor in neighbors {
                    if neighbor == parent {
                        continue // Ignore the edge back to the parent
                    }
                    if visited.contains(neighbor) {
                        return false // Cycle detected
                    }
                    if !dfs(node: neighbor, parent: node) {
                        return false
                    }
                }
            }
            return true
        }

        if !dfs(node: 0, parent: -1) {
            return false
        }
        return visited.count == n
    }
}