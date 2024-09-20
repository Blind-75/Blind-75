class Solution {
    class UnionFind {
        private var parent: [Int]
        private var rank: [Int]
        
        init(_ n: Int) {
            parent = Array(0..<n)
            rank = Array(repeating: 0, count: n)
        }
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])  // 경로 압축
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            
            if rootX != rootY {
                if rank[rootX] < rank[rootY] {
                    parent[rootX] = rootY
                } else if rank[rootX] > rank[rootY] {
                    parent[rootY] = rootX
                } else {
                    parent[rootY] = rootX
                    rank[rootX] += 1
                }
            }
        }
    }
    
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        let uf = UnionFind(n)
        
        // 모든 엣지에 대해 union 연산 수행
        for edge in edges {
            uf.union(edge[0], edge[1])
        }
        
        // 연결 요소의 수 계산
        var components = Set<Int>()
        for i in 0..<n {
            components.insert(uf.find(i))
        }
        
        return components.count
    }
}