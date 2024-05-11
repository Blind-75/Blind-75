class Solution {
    
    func find(_ i: Int, _ parents: inout [Int: Int]) -> Int {
        if i == parents[i] {
            return i
        }
        let parent = parents[i]!
        let updatedParent = find(parent, &parents)
        parents[i] = updatedParent
        return updatedParent
    }


    
    func union(_ k: Int, _ v : Int, _ parents: inout [Int: Int], _ ranks: inout [Int: Int]) -> Void {
        let root_k = self.find(k, &parents)
        let root_v = self.find(v, &parents)
        
        if root_k == root_v {
            return
        }
        
        if ranks[root_k]! < ranks[root_v]! {
            parents[root_k] = root_v
        }
        else if ranks[root_k]! > ranks[root_v]! {
            parents[root_v] = root_k
        }
        
        else if ranks[root_k]! == ranks[root_v]! {
            ranks[root_k, default: 0] += 1
            parents[root_v] = root_k
        }
    }
    
    func longestConsecutive(_ nums: [Int]) -> Int {
        var parents: [Int:Int] = [:]
        var ranks: [Int:Int] = [:]
       
        for num in nums {
            parents[num] = num
            ranks[num] = 1
        }
        
        var visited: Set<Int> = []
        for num in nums{
            visited.insert(num)
            if visited.contains(num-1){
                self.union(num, num-1, &parents, &ranks)
            }
            if visited.contains(num+1){
                self.union(num, num+1, &parents, &ranks)
            }
        }
        
        for (key, _) in parents{
            self.find(key, &parents)
        }
        
        var freqDist: [Int:Int] = [:]
        for (key, value) in parents {
            freqDist[value, default:0] += 1
        }
        
        var maxVal = 0
        for (key, value) in freqDist {
            maxVal = max(maxVal, value)
        }
       return maxVal
    }
}
