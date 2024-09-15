class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var visited: [Int: Node] = [:]
        return dfs(node: node, visited: &visited)

        func dfs(node: Node?, visited: inout [Int: Node]) -> Node? {
            guard let node = node else { return nil }

            let new = Node(node.val)
            visited[new.val] = new

            for neighbour in node.neighbors where neighbour != nil {
                guard let nbr = visited[neighbour!.val] ?? dfs(node: neighbour, visited: &visited) else { continue }
                new.neighbors.append(nbr)
            }

            return new
        }
    }
}