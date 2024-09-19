class Solution {
    func union(_ k: Int, _ v: Int, _ parents: inout [Int], _ ranks: inout [Int])->Bool{
        var root_k = self.find(k, &parents)
        var root_v = self.find(v, &parents)
        var ranks_k = ranks[root_k]
        var ranks_v = ranks[root_v]

        if root_k == root_v {
            return false
        }

        if ranks_k > ranks_v {
            parents[root_k] = root_v
            ranks[root_k] = ranks_v
        }

        else {
            parents[root_v] = root_k
            ranks[root_v] = ranks_k
        }

        return true
    }


    func find(_ i: Int, _ parents: inout [Int]) -> Int {
        if i == parents[i] {
            return i
        }
        
        //collapsing find
        parents[i] = self.find(parents[i], &parents)
        return parents[i]
    }
    
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var parents: [Int] = []
        var ranks: [Int] = []
        for i in 0..<n {
            parents.append(i)
            ranks.append(i)
        }

        for edge in edges {
            let k = edge[0]
            let v = edge[1]
            if !self.union(k, v, &parents, &ranks) {
                return false
            }
        }

        for i in 0..<n {
            self.find(i, &parents)
        }

        for parent in parents { 
            if parent != 0 {
                return false
            }
        }
        return true
    }
}
