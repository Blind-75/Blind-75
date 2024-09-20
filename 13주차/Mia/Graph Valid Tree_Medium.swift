class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool { 
        var path = Set<Int>()
        var visited = Set<Int>()

        var childrenList = [Int: [Int]]()

        for i in edges {
            if var children = childrenList[i[0]] {
                children.append(i[1])
                childrenList[i[0]] = children
            } else {
                childrenList[i[0]] = [i[1]]
            }
        }

        func dfs(value: Int) -> Bool {
            if path.contains(value) { return false }
            path.insert(value) 
            if let neighbours = childrenList[value] {
                for neighbour in neighbours {
                    if !dfs(value: neighbour) {
                        return false
                    }
                }
            }
            path.remove(value)
            return true
        }

        for item in edges {
            if !visited.contains(item[0]) {
                if !dfs(value: item[0]){
                    return false
                }
                visited.insert(item[0])
            }
        }
        return true
    }
}