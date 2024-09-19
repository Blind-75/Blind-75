class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        // 엣지 개수 확인
        if edges.count != n - 1 {
            return false
        }
        
        // Union-Find 초기화
        var parent = Array(0..<n)
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])  // 경로 압축
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) -> Bool {
            let rootX = find(x)
            let rootY = find(y)
            if rootX == rootY {
                return false  // 사이클 발견
            }
            parent[rootX] = rootY
            return true
        }
        
        // 각 엣지에 대해 union 연산 수행
        for edge in edges {
            if !union(edge[0], edge[1]) {
                return false
            }
        }
        
        return true
    }
}