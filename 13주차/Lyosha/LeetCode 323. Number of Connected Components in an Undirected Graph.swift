class Solution {
    func union(_ k : Int, _ v : Int, _ parents: inout [Int], _ ranks: inout [Int]) {
        let root_k = self.find(k, &parents)
        let root_v = self.find(v, &parents)
        let rank_k = ranks[root_k]
        let rank_v = ranks[root_v]

        if rank_k > rank_v {
            parents[root_v] = root_k
            ranks[root_v] = root_k
        }

        else { 
            parents[root_k] = root_v
            ranks[root_k] = root_v
        }
    }

    func find( _ i :Int, _ parents: inout [Int]) -> Int{
        //collapsing find
        if i == parents[i] {
            return i
        }
        parents[i] = self.find(parents[i], &parents)
        return parents[i]
    }

    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var num_components = n
        var parents: [Int] = []
        var ranks: [Int] = []
        for i in 0..<n {
            parents.append(i)
            ranks.append(i)
        }
        for edge in edges {
            let k = edge[0] 
            let v = edge[1]
            let k_root = self.find(k, &parents)
            let v_root = self.find(v, &parents)
            if k_root != v_root {
                num_components -= 1
            }
            self.union(k_root, v_root, &parents, &ranks)
        }

        return num_components
    }
}